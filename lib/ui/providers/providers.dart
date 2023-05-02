import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebamattsa/domain/models/customer/customer.dart';

import '../../config/providers/Authentication_provider.dart';

final getCustomerProvider = FutureProvider.autoDispose((ref) {
  final customerRepsitory = ref.watch(customerDataProvider).getAllCustomer();

  return customerRepsitory;
});

final selectedCustomer = StateProvider<String?>((context) => null);


