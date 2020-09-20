import 'package:meta/meta.dart';
import 'package:redux_epic_by_example/pages/movies/state.dart';

@immutable
class AppState {
  const AppState({
    @required this.movieState,
  }) : assert(movieState != null);

  factory AppState.initialState() {
    return AppState(
      movieState: MovieState.initialState(),
    );
  }

  AppState copyWith({
    MovieState movieState,
  }) {
    return AppState(
      movieState: movieState ?? this.movieState,
    );
  }

  final MovieState movieState;
}
