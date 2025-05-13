import 'package:mobx/mobx.dart';
import 'commands.dart';

part 'base_store.dart';
part 'item_store.dart';
part 'list_store.dart';
part 'controllers.g.dart';

abstract class AsyncDataStore<T> = AsyncDataStoreBase<T> with _$AsyncDataStore;

abstract class ItemStore<I, O> = ItemStoreBase<I, O> with _$ItemStore;

abstract class ListStore<I, D> = ListStoreBase<I, D> with _$ListStore;

abstract class VoidStore<I> = ItemStoreBase<I, void> with _$ItemStore;
