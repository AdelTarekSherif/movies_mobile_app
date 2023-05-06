import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_mobile_app/bloc/movies/movies_bloc.dart';
import 'package:movies_mobile_app/data/repository/movies/movies_repository.dart';
import 'package:movies_mobile_app/utils/constants.dart';
import 'package:movies_mobile_app/utils/router/route_generator.dart';
import 'package:movies_mobile_app/utils/router/route_names.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /// Lock device on portrait mode only
  SystemChrome
      .setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ])
      .then((value) =>
      runApp(const MyHomePage()));
  }

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesBloc(MoviesRepository()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        initialRoute: RouteNames.rLandingPage,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
