import 'package:astrotak/pages/askQuestion/ask_question.dart';
import 'package:astrotak/pages/splash.dart';
import 'package:astrotak/routes/routes.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.askQuestion:
        return MaterialPageRoute(builder: (_) => const AskQuestionPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text("Error Route"),
                  ),
                ));
    }
  }
}
