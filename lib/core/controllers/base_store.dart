part of 'controllers.dart';

abstract class AsyncDataStoreBase<T> with Store {
  @observable
  ObservableFuture<T?>? loadingFuture;

  @computed
  Object? get error {
    if (loadingFuture?.status == FutureStatus.rejected) {
      return loadingFuture!.error;
    }
    return null;
  }

  @computed
  bool get isLoading => loadingFuture != null && loadingFuture!.status == FutureStatus.pending;

  @computed
  bool get isLoaded => loadingFuture != null && loadingFuture!.status == FutureStatus.fulfilled;
}
