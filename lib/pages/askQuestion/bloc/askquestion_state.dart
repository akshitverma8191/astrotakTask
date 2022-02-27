part of 'askquestion_bloc.dart';

@immutable
abstract class AskquestionState {}

class AskquestionInitial extends AskquestionState {}

class AskQuestionLoading extends AskquestionState {}

class AskQuestionLoaded extends AskquestionState {
  final List<AskQuestionModel> _list;
  AskQuestionLoaded(this._list);

  List<AskQuestionModel> get questionList => _list;
}
