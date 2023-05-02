import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebamattsa/domain/models/customer/gateway_repository/customer_repository.dart';
import 'package:pruebamattsa/domain/use_cases/oven/oven_use_case.dart';
import 'package:pruebamattsa/infraestructure/driven_adapter/api/user_api/authentication_api.dart';
import 'package:pruebamattsa/infraestructure/driven_adapter/gateway_impl/oven_repository_impl.dart';
import 'package:pruebamattsa/infraestructure/helpers/http.dart';

import '../../domain/use_cases/customer/customer_use_case.dart';
import '../../domain/use_cases/user_data/authentication.dart';
import '../../infraestructure/driven_adapter/api/customer_api/customerprovider.dart';
import '../../infraestructure/driven_adapter/gateway_impl/authentication_repository_impl.dart';
import '../../infraestructure/driven_adapter/gateway_impl/customer_repository_impl.dart';

final authenticationProvider = Provider<AuthentificationUseCase>(
  (ref) {
    return AuthentificationUseCase(AuthenticationRepositoryImpl(
        AuthenticationApi(Http(baseUrl: 'https://mattsa.artendigital.mx'))));
  },
);

final customerDataProvider = Provider<CustomerDataUseCase>(
  (ref) {
    return CustomerDataUseCase(CustomerRepositoryImpl(
        CustomerProvider(Http(baseUrl: 'https://mattsa.artendigital.mx'))));
  },
);

final ovenDataProvider = Provider<OvenDataCaseUse>((ref) {
  return OvenDataCaseUse(
      OvenRepositoryImpl(Http(baseUrl: 'https://mattsa.artendigital.mx')));
});
