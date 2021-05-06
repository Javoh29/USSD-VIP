import 'package:flutter/material.dart';
import 'package:ussd_vip/ui/pages/internet_page.dart';
import 'package:ussd_vip/ui/pages/minutes_page.dart';
import 'package:ussd_vip/ui/pages/tariffs_page.dart';
import 'package:ussd_vip/ui/pages/services_page.dart';
import 'package:ussd_vip/ui/pages/ussd_page.dart';
import 'package:ussd_vip/ui/pages/sms_page.dart';
import 'package:ussd_vip/ui/pages/main_page.dart';

class Routes {
  static const main = '/';
  static const internetPage = '/internetPage';
  static const minutesPage = '/minutesPage';
  static const smsPage = '/smsPage';
  static const tariffsPage = '/tariffsPage';
  static const ussdPage = '/ussdPage';
  static const servicesPage = '/servicesPage';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      switch (routeSettings.name) {
        case main:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => MainPage(),
          );
        case internetPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => InternetPage(),
          );
        case minutesPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => MinutesPage(),
          );
        case smsPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => SmsPage(),
          );
        case tariffsPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => TariffsPage(),
          );
        case ussdPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => UssdPage(),
          );
        case servicesPage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => ServicesPage(),
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
