import 'package:flutter/material.dart';
import 'package:movies_mobile_app/utils/router/route_generator.dart';
import 'package:movies_mobile_app/utils/router/route_names.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Movies App",
      initialRoute: RouteNames.rLandingPage,
      onGenerateRoute: RouteGenerator.generateRoute,
      
    );
  }
}
