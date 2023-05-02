import 'package:pruebamattsa/domain/models/ovens/gateway_repository/oven_repository.dart';
import 'package:pruebamattsa/domain/models/ovens/oven.dart';

class OvenDataCaseUse {
  final OvenRepository ovenDatagateway;

  OvenDataCaseUse(this.ovenDatagateway);

  Future<List<Oven>> getAllOvens(int id) => ovenDatagateway.getAllOvens(id);
}
