import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epic_by_example/model/movie.dart';
import 'package:redux_epic_by_example/pages/movies/actions.dart';
import 'package:redux_epic_by_example/redux/app_state.dart';

class MoviesListContainer extends StatelessWidget {
  const MoviesListContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.from(
        store,
      ),
      builder: (context, viewModel) {
        return Container(
          color: Colors.grey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: FlatButton(
                  child: Text('Fetch again'),
                  onPressed: viewModel.fetchData,
                  color: Colors.blue,
                ),
              ),
              Expanded(child: _buildMoviesList(viewModel)),
            ],
          ),
        );
      },
    );
  }

  ListView _buildMoviesList(_ViewModel viewModel) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8),
      itemCount: viewModel.movies.length,
      itemBuilder: (BuildContext context, int index) => Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(viewModel.movies[index].title),
            Text(viewModel.movies[index].description),
            Text(viewModel.movies[index].fetchTime),
          ],
        ),
      ),
    );
  }
}

@immutable
class _ViewModel {
  const _ViewModel._({
    @required this.onDispatch,
    @required this.movies,
  })  : assert(onDispatch != null),
        assert(movies != null);

  factory _ViewModel.from(Store<AppState> store) {
    return _ViewModel._(
      onDispatch: store.dispatch,
      movies: store.state.movieState.movies,
    );
  }

  final Function(dynamic) onDispatch;
  final List<Movie> movies;

  void fetchData() => onDispatch(FetchMoviesAction());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          const ListEquality().equals(movies, other.movies);

  @override
  int get hashCode => movies.hashCode;
}
