import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_86/repositories/game_repository.dart';
import 'package:lesson_86/ui/screens/game_screen.dart';
import 'package:lesson_86/ui/screens/home_screen.dart';

import 'blocs/game_bloc.dart';
import 'blocs/game_event.dart';

void main() {
  final gameRepository = GameRepository();

  runApp(MyApp(gameRepository: gameRepository));
}

class MyApp extends StatelessWidget {
  final GameRepository gameRepository;

  MyApp({required this.gameRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => GameBloc(gameRepository)..add(LoadQuestions()),
        child: const GameScreen(),
      ),
    );
  }
}
