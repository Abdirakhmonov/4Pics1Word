import '../models/question.dart';

sealed class GameState {}

class GameInitial extends GameState {}

class GameLoading extends GameState {}

class GameLoaded extends GameState {
  final List<Question> questions;
  final int currentQuestionIndex;
  final List<bool> correctAnswers;
  final bool isCorrect;

  GameLoaded({
    required this.questions,
    required this.currentQuestionIndex,
    required this.correctAnswers,
    this.isCorrect = false,
  });

  Question get currentQuestion => questions[currentQuestionIndex];
}

class GameFinished extends GameState {
  final int score;
  final int totalQuestions;

  GameFinished({required this.score, required this.totalQuestions});
}
