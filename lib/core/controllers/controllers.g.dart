// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controllers.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AsyncDataStore<T> on AsyncDataStoreBase<T>, Store {
  Computed<Object?>? _$errorComputed;

  @override
  Object? get error => (_$errorComputed ??= Computed<Object?>(() => super.error,
          name: 'AsyncDataStoreBase.error'))
      .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'AsyncDataStoreBase.isLoading'))
          .value;
  Computed<bool>? _$isLoadedComputed;

  @override
  bool get isLoaded =>
      (_$isLoadedComputed ??= Computed<bool>(() => super.isLoaded,
              name: 'AsyncDataStoreBase.isLoaded'))
          .value;

  late final _$loadingFutureAtom =
      Atom(name: 'AsyncDataStoreBase.loadingFuture', context: context);

  @override
  ObservableFuture<T?>? get loadingFuture {
    _$loadingFutureAtom.reportRead();
    return super.loadingFuture;
  }

  @override
  set loadingFuture(ObservableFuture<T?>? value) {
    _$loadingFutureAtom.reportWrite(value, super.loadingFuture, () {
      super.loadingFuture = value;
    });
  }

  @override
  String toString() {
    return '''
loadingFuture: ${loadingFuture},
error: ${error},
isLoading: ${isLoading},
isLoaded: ${isLoaded}
    ''';
  }
}

mixin _$ItemStore<I, O> on ItemStoreBase<I, O>, Store {
  late final _$dataAtom = Atom(name: 'ItemStoreBase.data', context: context);

  @override
  O? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(O? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('ItemStoreBase.load', context: context);

  @override
  Future<void> load(I param) {
    return _$loadAsyncAction.run(() => super.load(param));
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}

mixin _$ListStore<I, D> on ListStoreBase<I, D>, Store {
  late final _$dataAtom = Atom(name: 'ListStoreBase.data', context: context);

  @override
  List<D> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<D> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$sourceAtom =
      Atom(name: 'ListStoreBase.source', context: context);

  @override
  I? get source {
    _$sourceAtom.reportRead();
    return super.source;
  }

  @override
  set source(I? value) {
    _$sourceAtom.reportWrite(value, super.source, () {
      super.source = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('ListStoreBase.load', context: context);

  @override
  Future<void> load(I param) {
    return _$loadAsyncAction.run(() => super.load(param));
  }

  @override
  String toString() {
    return '''
data: ${data},
source: ${source}
    ''';
  }
}
