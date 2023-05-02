import '../../../domain/models/user_data/gateway_repository/authentication_repository.dart';
import '../../../domain/models/user_data/response/login_response.dart';
import '../api/user_api/authentication_api.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApi _api;

  AuthenticationRepositoryImpl(this._api);
  @override
  Future<String?> get accessToken async {
    await Future.delayed(const Duration(seconds: 1));
    return null;
  }

  @override
  Future<LoginResponse> login(String email, String password) {
    return _api.login(email, password);
  }
}
