import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_epic_by_example/pages/movies/movies_screen.dart';
import 'package:redux_epic_by_example/redux/app_state.dart';
import 'package:redux_epic_by_example/redux/core.dart';

void main() {
  runApp(
    StoreProvider<AppState>(
      store: (AppStore.inject()..dispatchInitial()).store,
      child: MaterialApp(
        title: 'Movie',
        home: MoviesListContainer(),
      ),
    ),
  );
}

