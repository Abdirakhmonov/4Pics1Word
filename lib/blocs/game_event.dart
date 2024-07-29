sealed class GameEvent {}

class LoadQuestions extends GameEvent {}

class CheckAnswer extends GameEvent {
  final String answer;

  CheckAnswer(this.answer);
}
