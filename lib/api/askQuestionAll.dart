import 'dart:convert';
import 'dart:developer';

import 'package:astrotak/model/ask_question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AskQuestionApi {
  @protected
  String _url = 'https://staging-api.astrotak.com/api/question/category/all';

  Future<List<AskQuestionModel>> getQuestions() async {
    List<AskQuestionModel> questions = [];
    try {
      var resuslt = await http.get(Uri.parse(_url));
      Map x = json.decode(resuslt.body);
      List suggestions = x["data"];
      for (Map obj in suggestions) {
        AskQuestionModel model = AskQuestionModel(obj);
        questions.add(model);
      }
    } catch (e) {
      print("faced error");
      log(e.toString());
    }
    return questions;
  }
}
