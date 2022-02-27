import 'package:astrotak/api/api.dart';
import 'package:astrotak/model/ask_question_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'askquestion_event.dart';
part 'askquestion_state.dart';

class AskquestionBloc extends Bloc<AskquestionEvent, AskquestionState> {
  // AskquestionBloc() : super(AskquestionInitial());
  AskquestionBloc() : super(AskquestionInitial()) {
    on<AskquestionEvent>((event, emit) async {
      if (event is AskQuestionLoad) {
        await API.getInstance.askQuestionApi().getQuestions().then((value) {
          if (value.isNotEmpty) {
            emit(AskQuestionLoaded(value));
          }
        });
      }
    });
  }
}
