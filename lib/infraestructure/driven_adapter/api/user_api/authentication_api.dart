import 'dart:async';
import 'dart:io';

import '../../../../domain/models/user_data/response/login_response.dart';
import '../../../helpers/http.dart';
import '../../../helpers/http_method.dart';

class AuthenticationApi {
  final Http _http;

  AuthenticationApi(this._http);
  Future<LoginResponse> login(String email, String password) async {
    _http.typeHeader = "onlyjson"; 
    final result = await _http.request<String>(
      '/api/acceso', //  /api/lifting/datos/cliente/insert  /api/Login
      // queryParameters: {"delay": "5"},
      method: HttpMethod.post,
      body: {
        "email": email, "password": password
        // "id_custumer": 5,
        // "id_oven": 6,
        // "id_domicilio": 7,
        // "service_type": "pruebass",
        // 'name':"jsdfnksdn",
      }, //{"email": email, "password": password}
      parser: (data) {
        print(data);

        ///aqui esta se maneja el tipado de datos al momento de recibirlo.
        return data['res'].toString();
      },
    );

    print("result data ${result.data}");
    print("result data runtimeType ${result.data.runtimeType}");
    print("result error data ${result.error?.exception}");
    print("result error data ${result.error?.stackTrace}");
    print("result statusCode ${result.statusCode}");
    if (result.error == null) {
      return LoginResponse.ok;
    }

    if (result.statusCode == 400) {
      return LoginResponse.accessDenied;
    }
    final error = result.error!.exception;
    if (error is SocketException || error is TimeoutException) {
      return LoginResponse.networkError;
    }

    return LoginResponse.unknownError;
  }
}
