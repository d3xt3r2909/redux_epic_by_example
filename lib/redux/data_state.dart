import 'package:meta/meta.dart';

@immutable
class DataState {
  const DataState({@required this.loadingState, this.exception})
      : assert(loadingState != null);

  const DataState.none()
      : this(
    loadingState: LoadingState.none,
    exception: null,
  );

  factory DataState.error(Exception exception) {
    return DataState(
      loadingState: LoadingState.error,
      exception: exception,
    );
  }

  factory DataState.partial() {
    return DataState(
      loadingState: LoadingState.partial,
      exception: null,
    );
  }

  factory DataState.full() {
    return DataState(
      loadingState: LoadingState.full,
      exception: null,
    );
  }

  factory DataState.loading() {
    return DataState(
      loadingState: LoadingState.loading,
      exception: null,
    );
  }

  final LoadingState loadingState;
  final Exception exception;

  bool get hasException => loadingState == LoadingState.error;

  bool get isLoading => loadingState == LoadingState.loading;

  @override
  String toString() {
    return 'DataState{loadingState: $loadingState, exception: $exception}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DataState &&
              runtimeType == other.runtimeType &&
              loadingState == other.loadingState &&
              exception == other.exception;

  @override
  int get hashCode => loadingState.hashCode ^ exception.hashCode;
}

enum LoadingState { none, partial, loading, full, error }
