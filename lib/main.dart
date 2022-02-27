import 'package:astrotak/pages/askQuestion/bloc/askquestion_bloc.dart';
import 'package:astrotak/routes/routes.dart';
import 'package:astrotak/routes/routes_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AstrotakApp());
}

class AstrotakApp extends StatelessWidget {
  const AstrotakApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AskquestionBloc>(create: (context) => AskquestionBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        onGenerateRoute: RoutesGenerator.generateRoute,
      ),
    );
  }
}
