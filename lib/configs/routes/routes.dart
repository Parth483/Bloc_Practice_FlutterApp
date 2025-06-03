import 'package:blocstructure/configs/routes/route_export.dart';
import 'package:blocstructure/configs/routes/route_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const Splashscreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const Homescreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => const Loginscreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
