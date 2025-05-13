// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  late final _$_userIdAtom =
      Atom(name: '_AuthStoreBase._userId', context: context);

  int? get userId {
    _$_userIdAtom.reportRead();
    return super._userId;
  }

  @override
  int? get _userId => userId;

  @override
  set _userId(int? value) {
    _$_userIdAtom.reportWrite(value, super._userId, () {
      super._userId = value;
    });
  }

  late final _$checkIfLoggedInAsyncAction =
      AsyncAction('_AuthStoreBase.checkIfLoggedIn', context: context);

  @override
  Future<void> checkIfLoggedIn() {
    return _$checkIfLoggedInAsyncAction.run(() => super.checkIfLoggedIn());
  }

  late final _$loginAsyncAction =
      AsyncAction('_AuthStoreBase.login', context: context);

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$registerAsyncAction =
      AsyncAction('_AuthStoreBase.register', context: context);

  @override
  Future<void> register(String email, String password, String fullname) {
    return _$registerAsyncAction
        .run(() => super.register(email, password, fullname));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthStoreBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
