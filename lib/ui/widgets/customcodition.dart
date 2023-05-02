import 'package:flutter/material.dart';
import 'package:pruebamattsa/ui/widgets/widgets.dart';

import '../themes/theme_data.dart';

class customcodition extends StatefulWidget {
  const customcodition({super.key});

  @override
  State<customcodition> createState() => _customcoditionState();
}

class _customcoditionState extends State<customcodition> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppThemeData.grayMattsa,
            blurRadius: 4.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              1.0, // Move to right 5  horizontally
              1.0, // Move to bottom 5 Vertically
            ),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          dropdowncustom(
            name: 'Estructural',
          ),
          dropdowncustom(
            name: 'Aleaciones',
          ),
          dropdowncustom(
            name: 'Tuberia',
          ),
          dropdowncustom(
            name: 'Refractario',
          ),
          dropdowncustom(
            name: 'Mecanico',
          ),
          dropdowncustom(
            name: 'Combustion',
          ),
          dropdowncustom(
            name: 'Electrico',
          ),
          dropdowncustom(
            name: 'Miscelaneo',
          ),
        ],
      ),
    );
  }
}

class FileListDropdownMenuItem extends DropdownMenuItem {
  FileListDropdownMenuItem(
    String labelText,
    bool showSelectedMark,
    String itemValue,
  ) : super(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(labelText),
                if (showSelectedMark) Icon(Icons.check)
              ],
            ),
          ),
          value: itemValue,
        );
}
