import 'package:pruebamattsa/domain/models/customer/direccion.dart';

import '../../models/customer/customer.dart';
import '../../models/customer/gateway_repository/customer_repository.dart';

class CustomerDataUseCase {
  final CustomerRepository customerDataGateway;

  CustomerDataUseCase(this.customerDataGateway);

  Future<List<Customer>> getAllCustomer() =>
      customerDataGateway.getAllCustomer();

  List<Customer> getone()=>customerDataGateway.getone();

  Future<List<Direccion>> getDirection(int idCustomer) =>
      customerDataGateway.getDirection(idCustomer);
}
