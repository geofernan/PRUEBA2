import '../../models/user_data/gateway_repository/authentication_repository.dart';
import '../../models/user_data/response/login_response.dart';

class AuthentificationUseCase {
  final AuthenticationRepository authentificationGateway;

  AuthentificationUseCase(this.authentificationGateway);
  Future<LoginResponse> login(String password, String email) =>
      authentificationGateway.login(email, password);
}
