import 'package:redux_epic_by_example/pages/movies/actions.dart';
import 'package:redux_epic_by_example/pages/movies/state.dart';

MovieState movieReducer(MovieState state, dynamic action) {
  if (action is FetchMoviesSucceededAction) {
    return state.copyWith(
      movies: List.from(action.movies),
    );
  }
  return state;
}
