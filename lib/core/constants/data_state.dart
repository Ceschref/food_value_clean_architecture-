enum DataState {
  init,
  preload,
  data,
  error,
  denied,
}

extension DataStateExtension on DataState {
  bool get isDataStateSuccess {
    return this == DataState.data;
  }

  bool get isLoading {
    return this == DataState.preload;
  }

  bool get isDataStateFailure {
    return this == DataState.error;
  }

  bool get isDataStateInit {
    return this == DataState.init;
  }

  bool get isShowLoading {
    return this == DataState.init || this == DataState.preload;
  }
}
