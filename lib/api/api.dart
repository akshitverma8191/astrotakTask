import 'package:astrotak/api/askQuestionAll.dart';

class API {
  static API? _instance;
  API._();
  String? sample;
  static API get getInstance => _instance ??= API._();

  AskQuestionApi askQuestionApi() {
    return AskQuestionApi();
  }
}
