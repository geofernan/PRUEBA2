import 'package:pruebamattsa/domain/models/customer/direccion.dart';

import '../customer.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getAllCustomer();

  Future<List<Direccion>> getDirection(int idCustomer);

  List<Customer> getone();
}
