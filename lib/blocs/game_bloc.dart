import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/game_repository.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepository gameRepository;

  GameBloc(this.gameRepository) : super(GameInitial()) {
    on<LoadQuestions>(_onLoadQuestions);
    on<CheckAnswer>(_onCheckAnswer);
  }

  void _onLoadQuestions(LoadQuestions event, Emitter<GameState> emit) {
    emit(GameLoading());
    try {
      final questions = gameRepository.getQuestions();
      emit(GameLoaded(
          questions: questions, currentQuestionIndex: 0, correctAnswers: []));
    } catch (_) {
      emit(GameInitial());
    }
  }

  void _onCheckAnswer(CheckAnswer event, Emitter<GameState> emit) {
    final state = this.state;
    if (state is GameLoaded) {
      final isCorrect = state.currentQuestion.answer == event.answer;
      final correctAnswers = List<bool>.from(state.correctAnswers)
        ..add(isCorrect);
      final nextIndex = state.currentQuestionIndex + 1;

      if (nextIndex < state.questions.length) {
        emit(GameLoaded(
          questions: state.questions,
          currentQuestionIndex: nextIndex,
          correctAnswers: correctAnswers,
          isCorrect: isCorrect,
        ));
      } else {
        final score = correctAnswers.where((correct) => correct).length;
        emit(
            GameFinished(score: score, totalQuestions: state.questions.length));
      }
    }
  }
}
