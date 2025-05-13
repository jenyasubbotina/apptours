part of 'controllers.dart';

abstract class ListStoreBase<I, D> extends AsyncDataStore<List<D>> with Store {
  AsyncListCommand<I, D> _dataLoader;

  ListStoreBase(this._dataLoader);

  @observable
  List<D> data = List.unmodifiable([]);

  @observable
  I? source;

  set loader (AsyncListCommand<I, D> loader) {
    _dataLoader = loader;
    loadingFuture = null;
    source = null;
    data = List.unmodifiable([]);
  }

  @action
  Future<void> load(I param) async {
    if (isLoading) return;

    source = param;
    final initialFuture = _dataLoader.execute(param);
    loadingFuture = ObservableFuture(initialFuture);
    data = (await loadingFuture) ?? [];
  }
}