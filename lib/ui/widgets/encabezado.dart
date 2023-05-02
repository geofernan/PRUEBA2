import 'package:flutter/material.dart';

class encabezado extends StatelessWidget {
  const encabezado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(flex: 3, child: Center(child: Text('Valeo'))),
          Divider(),
          Expanded(flex: 3, child: Center(child: Text('Car bottom'))),
          Divider(),
          Expanded(flex: 3, child: Center(child: Text('Mantenimiento'))),
        ],
      ),
    );
  }
}
