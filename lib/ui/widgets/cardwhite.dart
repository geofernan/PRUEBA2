import 'package:flutter/material.dart';

import '../themes/theme_data.dart';

class Cardwhite extends StatelessWidget {
  final Widget _son;
  const Cardwhite({Key? key, required Widget son})
      : _son = son,
        super(key: key);

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
      child: _son,
    );
    ;
  }
}
