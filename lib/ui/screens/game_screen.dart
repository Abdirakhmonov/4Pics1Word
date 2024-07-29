import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/game_bloc.dart';
import '../../blocs/game_event.dart';
import '../../blocs/game_state.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TextEditingController _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GameBloc>().add(LoadQuestions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GameBloc, GameState>(
        listener: (context, state) {
          if (state is GameLoaded && state.correctAnswers.isNotEmpty) {
            final isCorrect = state.correctAnswers.last;
            final message = isCorrect ? "Javobingiz to'gri!" : "Javobingiz noto'gri!";
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          }
        },
        builder: (context, state) {
          if (state is GameLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GameLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(state.currentQuestion.image),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _answerController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Javobingizni kiriting...",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Submit answer button
                FilledButton(
                  onPressed: () {
                    context
                        .read<GameBloc>()
                        .add(CheckAnswer(_answerController.text.toLowerCase()));
                    _answerController.clear();
                  },
                  child: const Text('Yuborish'),
                ),
              ],
            );
          } else if (state is GameFinished) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("O'yin yakunlandi", style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 20),
                  Text('Natijangiz: ${state.score}/${state.totalQuestions}',
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      context.read<GameBloc>().add(LoadQuestions());
                    },
                    child: const Text('Qayta boshlash'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Boshlash uchun tugmani bosing'));
        },
      ),
    );
  }
}
