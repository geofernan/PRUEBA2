import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebamattsa/domain/models/customer/customer.dart';
import 'package:pruebamattsa/ui/pages/customers/widgets/dropdownC.dart';
import 'package:pruebamattsa/ui/pages/customers/widgets/dropdownO.dart';

import '../../../config/providers/Authentication_provider.dart';
import '../../widgets/widgets.dart';

class Custompage extends StatefulWidget {
  final WidgetRef ref;
  const Custompage({super.key, required this.ref});

  @override
  State<Custompage> createState() => _CustompageState();
}

class _CustompageState extends State<Custompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(),
      body: _bodycustom("Condicion Actual", "work"),
    );
  }

  Widget _bodycustom(String nombre, String nameIcon) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      children: <Widget>[
        buttonNext("Datos del cliente", nameIcon, context, 'customer'),
        Divider(),
        DropdownCustom(
            name: 'Cliente',
            customers: widget.ref.watch(customerDataProvider).getAllCustomer()),
        DropdownCustom(
            name: 'Division',
            customers: widget.ref.watch(customerDataProvider).getAllCustomer()),
        DropdownCustomOven(
            name: 'Horno',
            ovens: widget.ref.watch(ovenDataProvider).getAllOvens(5)),
        DropdownCustomOven(
            name: 'Servicios',
            ovens: widget.ref.watch(ovenDataProvider).getAllOvens(5)),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child:
                buttonNext("Siguientes", nameIcon, context, 'liftingEvidence')),
      ],
    );
  }
}
