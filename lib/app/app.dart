import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebamattsa/ui/pages/home_page.dart';
import '../config/routes/app_routes.dart';
import '../ui/pages/login_page.dart';
import '../ui/pages/customers/customer_page.dart';
import '../ui/pages/newcustomers/customer_screen.dart';

class CleanArchExampleSepareteUsingFolderApp extends ConsumerWidget {
  const CleanArchExampleSepareteUsingFolderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      onGenerateRoute: (routeSetting) {
        switch (routeSetting.name) {
          case (AppRoutes.login):
            return MaterialPageRoute(
                builder: ((context) => LoginPage(
                      ref: ref,
                    )));
          case (AppRoutes.homepage):
            return MaterialPageRoute(builder: ((context) => HomePage()));
          case (AppRoutes.customerpage):
            return MaterialPageRoute(
                builder: ((context) => CustomerScreen()));
          default:
            return MaterialPageRoute(
                builder: ((context) => LoginPage(
                      ref: ref,
                    )));
        }
      },
    );
  }
}
