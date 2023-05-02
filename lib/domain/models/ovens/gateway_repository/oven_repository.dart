import 'package:pruebamattsa/domain/models/ovens/oven.dart';

abstract class OvenRepository {
  Future<List<Oven>> getAllOvens(int id);
}
