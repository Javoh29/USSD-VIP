import 'package:flutter/material.dart';
import 'package:ussd_vip/ui/pages/main_page.dart';

class Routes {
  static const main = '/';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      final Map<String, dynamic> args = routeSettings.arguments;

      switch (routeSettings.name) {
        case main:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => MainPage(),
          );
        default:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => MainPage(),
          );
      }
    } catch (_) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MainPage(),
      );
    }
  }
}
