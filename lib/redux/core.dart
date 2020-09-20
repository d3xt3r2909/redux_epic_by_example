import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_epic_by_example/pages/movies/actions.dart';
import 'package:redux_epic_by_example/pages/movies/reducer.dart';
import 'package:redux_epic_by_example/redux/app_state.dart';
import 'package:redux_epic_by_example/redux/epics.dart';
import 'package:redux_epics/redux_epics.dart';

AppState reducer(AppState state, dynamic action) {
  return AppState(
    movieState: movieReducer(state.movieState, action),
  );
}

@immutable
class AppStore {
  const AppStore({
    @required this.store,
  }) : assert(store != null);

  factory AppStore.inject() {
    return AppStore(
      store: Store<AppState>(
        reducer,
        initialState: _injectedState(),
        middleware: [
          EpicMiddleware<AppState>(epics()),
        ],
      ),
    );
  }

  static AppState _injectedState() {
    return AppState.initialState();
  }

  final Store<AppState> store;

  Future dispatchInitial() => store.dispatch(FetchMoviesAction());
}
