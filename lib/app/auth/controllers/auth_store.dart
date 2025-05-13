import 'package:mobx/mobx.dart';
import 'package:apptours/app/auth/repository/user_repository.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/core/controllers/controllers.dart';
import 'package:apptours/main.dart';

part 'auth_store.g.dart';

class AuthStore extends _AuthStoreBase with _$AuthStore {
  AuthStore() : super();
}

abstract class _AuthStoreBase extends AsyncDataStore with Store {
  final _service = di.get<ApiService>();
  final _userRepository = di.get<UserRepository>();

  @readonly
  int? _userId;

  _AuthStoreBase();

  @action
  Future<void> checkIfLoggedIn() async {
    _userId = null;
    loadingFuture = ObservableFuture(_userRepository.getUserId());
    _userId = await loadingFuture as int?;
  }

  @action
  Future<void> login(String email, String password) async {
    loadingFuture = ObservableFuture(
      _service.login(email: email, password: password).then(
        (result) {
          if (result) {
            checkIfLoggedIn();
          }
        },
      ),
    );
    await loadingFuture;
  }

  @action
  Future<void> register(String email, String password, String fullname) async {
    loadingFuture = ObservableFuture(
      _service.register(email: email, password: password, fullName: fullname).then(
        (result) {
          if (result) {
            checkIfLoggedIn();
          }
        },
      ),
    );
    await loadingFuture;
  }

  @action
  Future<void> logout() async {
    _userRepository.logout();
  }
}
