import 'package:meta/meta.dart';
import 'package:redux_epic_by_example/model/movie.dart';
import 'package:redux_epic_by_example/redux/data_state.dart';

@immutable
class MovieState {
  const MovieState({
    @required this.data,
    @required this.movies,
  })  : assert(data != null),
        assert(movies != null);

  MovieState.initialState()
      : data = DataState.none(),
        movies = [];

  final DataState data;
  final List<Movie> movies;

  MovieState copyWith({
    DataState data,
    List<Movie> movies,
  }) {
    return MovieState(
      data: data ?? this.data,
      movies: movies ?? this.movies,
    );
  }
}
