import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebamattsa/ui/pages/newcustomers/prueba.dart';

import '../../../config/providers/Authentication_provider.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';
import 'dropdownnewc.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(),
      body: _ScreenView(),
    );
  }
}

class _ScreenView extends ConsumerWidget {
  const _ScreenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(customerDataProvider).getAllCustomer();
    final  d = ref.read(selectedCustomer.notifier).state ?? "62";
    final ovens = ref.watch(ovenDataProvider).getAllOvens(int.parse(d));
    final sortType = ref.watch(selectedCustomer);
    final direcciones = ref.watch(customerDataProvider).getDirection(int.parse(d));
    const  p = "hola";
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            CustomDropDown(
              type: 'customers',
              provider: customers,
            ),
            CustomDropDown(
              type:'ovens',
              provider: ovens,
            ),
            CustomDropDown(
              type:'direcciones',
              provider: direcciones,
            ),
            GestureDetector(
              child: const Text("otra prueba"),
              onTap: () {
                ref.watch(customerDataProvider).getone();
              },
            ),
          
            const Positioned(bottom: 20, child: Text("prueba")),
          ],
        ),
      ),
    );
  }
}
