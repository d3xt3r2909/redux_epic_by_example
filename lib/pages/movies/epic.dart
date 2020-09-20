import 'dart:async';

import 'package:redux_epic_by_example/api/mock_data.dart';
import 'package:redux_epic_by_example/pages/movies/actions.dart';
import 'package:redux_epic_by_example/redux/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

Epic<AppState> _fetchMoviesEpic() =>
    (Stream<dynamic> actions, EpicStore<AppState> store) {
      return actions
          .whereType<FetchMoviesAction>()
          .switchMap((action) => _fetchMovies());
    };

Stream<dynamic> _fetchMovies() async* {
  try {
    // Place where you would fetch data from API
    final data = fetchMockDataArray();

    yield FetchMoviesSucceededAction(data);
    yield AutomaticRefreshDataAction();
  } on Exception catch (e) {
    // You can log the exception, send event to you analytics, chain other epics...
    yield FetchMoviesFailedAction(e);
  }
}

Epic<AppState> _fetchMoviesAnalyticsEpic() =>
    (Stream<dynamic> actions, EpicStore<AppState> store) {
      return actions
          .whereType<FetchMoviesSucceededAction>()
          .switchMap((action) => _fetchMoviesAnalytics(action));
    };

Stream<dynamic> _fetchMoviesAnalytics(
    FetchMoviesSucceededAction action) async* {
  print('Total elements inside array: ${action.movies.length}');
}

Epic<AppState> _timeDataRefreshEpic() =>
    (Stream<dynamic> actions, EpicStore<AppState> store) {
      return actions.whereType<AutomaticRefreshDataAction>().switchMap(
            (_) => Stream.periodic(const Duration(minutes: 5))
                .switchMap((_) => _autoRefreshData()),
          );
    };

Stream<dynamic> _autoRefreshData() async* {
  yield FetchMoviesAction();
}

Epic<AppState> moviesEpics() => combineEpics<AppState>([
      _fetchMoviesEpic(),
      _fetchMoviesAnalyticsEpic(),
      _timeDataRefreshEpic(),
    ]);
