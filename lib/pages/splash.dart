import 'package:astrotak/pages/askQuestion/bloc/askquestion_bloc.dart';
import 'package:astrotak/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> loadScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
    Navigator.pushNamed(context, Routes.askQuestion);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    context.read<AskquestionBloc>().add(AskQuestionLoad());
    loadScreen(context);
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * .1,
              width: size.height * .1,
              margin: const EdgeInsets.only(bottom: 25),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/logo.png"), fit: BoxFit.contain),
              ),
            ),
            const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFf28e23))),
          ],
        ),
      ),
    );
  }
}
