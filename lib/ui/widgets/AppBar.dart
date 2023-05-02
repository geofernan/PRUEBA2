import 'package:flutter/material.dart';

import '../themes/theme_data.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppThemeData.blueMattsa,
      title: Container(
          // <--- Change here
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height *
                  0.1), // <-- play with the double number
          child: Image.asset("assets/mattsapro.png", fit: BoxFit.cover)),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
