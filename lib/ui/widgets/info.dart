import 'package:flutter/material.dart';

import '../utils/icono_string_util.dart';

class InfoGn extends StatelessWidget {
  const InfoGn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              ListTile(
                title: Text(
                  'Valeo',
                  style: TextStyle(color: Colors.black),
                ),
                leading: getIcon('work', Colors.white, 20),
              ),
              ListTile(
                title: Text(
                  'Valeo',
                  style: TextStyle(color: Colors.black),
                ),
                leading: getIcon('work', Colors.white, 20),
              ),
              ListTile(
                title: Text(
                  'Valeo',
                  style: TextStyle(color: Colors.black),
                ),
                leading: getIcon('work', Colors.white, 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
