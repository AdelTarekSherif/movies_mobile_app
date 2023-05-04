import 'package:flutter/material.dart';
import 'package:movies_mobile_app/ui/modules/home/home_page.dart';
import 'package:movies_mobile_app/ui/modules/landing/landing_page.dart';
import 'package:movies_mobile_app/utils/router/route_names.dart';

class RouteGenerator {
  RouteGenerator();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;
    debugPrint('Route to: ${settings.name}');
    switch (settings.name) {
      case RouteNames.rLandingPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.rLandingPage),
          builder: (_) => const LandingPage(),
        );
      case RouteNames.rHomePage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.rLandingPage),
          builder: (_) => const HomePage(),
        );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('ERROR')),
      );
    });
  }
}
