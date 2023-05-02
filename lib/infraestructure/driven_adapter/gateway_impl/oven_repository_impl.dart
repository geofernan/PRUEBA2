import '../../../domain/models/ovens/gateway_repository/oven_repository.dart';
import '../../../domain/models/ovens/oven.dart';
import '../../helpers/http.dart';
import '../../helpers/http_method.dart';

class OvenRepositoryImpl implements OvenRepository {
  final Http _http;

  OvenRepositoryImpl(this._http);

  @override
  Future<List<Oven>> getAllOvens(int id) async {
    List<Oven> ovens = [];
    _http.typeHeader = "onlyjsondssdfsd";
    final result = await _http.request<dynamic>(
      '/api/ovens/' + id.toString(),

      ///aqui concatenar si cuando se mande por get, dependiendo de quien la mande puede ser asi api/ovens/63
      //queryParameters: {"idCustomer": id.toString()}, /// utilizar este query parameters en caso de que se mande api/ovens?idcustomer=63
      method: HttpMethod.get,
      body: {},
      parser: (data) {
        var dataaux = data['data'];
        for (var i = 0; i < dataaux.length; i++) {
          print(dataaux[i]);
          // print(data[i]['IdCustomer']);
          ovens.add(Oven.fromJson(dataaux[i]));
        }
        print("Mis Customers ${ovens}");
        // final customer = customerFromJson(data);
        return data;
      },
    );

    print("result data ${result.data}");
    print("result data runtimeType ${result.data.runtimeType}");
    print("result error data ${result.error?.exception}");
    print("result error data ${result.error?.stackTrace}");
    print("result statusCode ${result.statusCode}");

    return ovens;
  }
}
