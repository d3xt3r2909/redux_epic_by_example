import 'package:redux_epic_by_example/model/movie.dart';

class FetchMoviesAction {
  const FetchMoviesAction();
}

class FetchMoviesSucceededAction {
  const FetchMoviesSucceededAction(this.movies) : assert(movies != null);

  final List<Movie> movies;
}

class FetchMoviesFailedAction {
  const FetchMoviesFailedAction(this.exception);

  final Exception exception;
}

class AutomaticRefreshDataAction {
  const AutomaticRefreshDataAction();
}

class AutomaticRefreshDataSucceededAction {
  const AutomaticRefreshDataSucceededAction(this.movies) : assert(movies != null);

  final List<Movie> movies;
}

class AutomaticRefreshDataFailedAction {
  const AutomaticRefreshDataFailedAction(this.exception);

  final Exception exception;
}
