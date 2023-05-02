import 'package:pruebamattsa/domain/models/customer/direccion.dart';

import '../../../domain/models/customer/customer.dart';
import '../../../domain/models/customer/gateway_repository/customer_repository.dart';
import '../../../domain/models/user_data/response/login_response.dart';
import '../../helpers/http.dart';
import '../../helpers/http_method.dart';
import '../api/customer_api/customerprovider.dart';
import '../api/user_api/authentication_api.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerProvider _api;
  // final Http _http;

  CustomerRepositoryImpl(this._api);

  @override
  Future<List<Customer>> getAllCustomer() async {
    return _api.getAllCustomer();
  }

  @override
  Future<List<Direccion>> getDirection(int idCustomer) async {
    return _api.getDirection(idCustomer);
  }

  @override
  List<Customer> getone() {
    return _api.getone();
  }
}
