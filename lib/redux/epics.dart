import 'package:redux_epic_by_example/pages/movies/epic.dart';
import 'package:redux_epic_by_example/redux/app_state.dart';
import 'package:redux_epics/redux_epics.dart';

Epic<AppState> epics() => combineEpics<AppState>([
  moviesEpics(),
]);
