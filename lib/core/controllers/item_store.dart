part of 'controllers.dart';

abstract class ItemStoreBase<I, O> extends AsyncDataStore<O> with Store {
  final AsyncCommand<I, O> _dataLoader;

  ItemStoreBase(this._dataLoader);

  bool get canReload;

  @observable
  O? data;

  @action
  Future<void> load(I param) async {
    if (isLoading || (data != null && !canReload)) return;

    data = null;
    final initialFuture = _dataLoader.execute(param);
    loadingFuture = ObservableFuture(initialFuture);
    data = await loadingFuture;
  }
}