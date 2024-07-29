import 'package:flutter/material.dart';
import 'package:lesson_86/ui/widgets/calculator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final aController = TextEditingController();
  final bController = TextEditingController();
  final calculator = Calculator();
  int? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: aController,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bController,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int a = int.parse(aController.text);
                      int b = int.parse(bController.text);
                      result = calculator.add(a, b);
                    });
                  },
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int a = int.parse(aController.text);
                      int b = int.parse(bController.text);
                      result = calculator.subtract(a, b);
                    });
                  },
                  child: const Text("-"),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
