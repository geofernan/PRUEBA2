import 'package:pruebamattsa/domain/models/customer/direccion.dart';

import '../../../../domain/models/customer/customer.dart';
import '../../../helpers/http.dart';
import '../../../helpers/http_method.dart';

class CustomerProvider {
  final Http _http;
  final List<Customer> customgeneral = [];

  CustomerProvider(this._http);
  @override
  Future<List<Customer>> getAllCustomer() async {
    List<Customer> customers = [];
    _http.typeHeader = "ggrrrrt";
    final result = await _http.request<dynamic>(
      '/api/custumers',
      // queryParameters: {"delay": "5"},
      method: HttpMethod.get,
      body: {},
      parser: (data) {
        final pru = data['data'];
        for (var i = 0; i < pru.length; i++) {
          // print(data[i]);
          // print(data[i]['IdCustomer']);
          customers.add(Customer.fromJson(pru[i]));
        }
        print("Mis Customers ${customers}");
        // final customer = customerFromJson(data);
        return data['res'];
      },
    );

    print("result data ${result.data}");
    print("result data runtimeType ${result.data.runtimeType}");
    print("result error data ${result.error?.exception}");
    print("result error data ${result.error?.stackTrace}");
    print("result statusCode ${result.statusCode}");

    return customers;
  }

  @override
  List<Customer> getone() {
    customgeneral.add(Customer(
        CRFC: "hdhksjsd",
        RSCustomer: "jsdnkndsn",
        IdCustomer: 4,
        CodCustomer: "dljns"));

    return customgeneral;
  }


  @override
  Future<List<Direccion>> getDirection(int idCustomer) async {
  List<Direccion> direcciones = [];
      _http.typeHeader = "ggrrrrt";
      final result = await _http.request<dynamic>(
        '/api/addresses/'+idCustomer.toString(),
        // queryParameters: {"delay": "5"},
        method: HttpMethod.get,
        body: {},
        parser: (data) {
          final pru = data['data'];
          for (var i = 0; i < pru.length; i++) {


            // print(data[i]);
            // print(data[i]['IdCustomer']);
            direcciones.add(Direccion.fromJson(pru[i]));
          }
          // print("Mis Customers ${customers}");
          // final customer = customerFromJson(data);
          return data['res'];
        },
      );

      print("result data ${result.data}");
      print("result data runtimeType ${result.data.runtimeType}");
      print("result error data ${result.error?.exception}");
      print("result error data ${result.error?.stackTrace}");
      print("result statusCode ${result.statusCode}");

      return direcciones;

    
  }
}
