import '../models/question.dart';

class GameRepository {
  List<Question> questions = [
    Question(
        image: "https://4pics1-word.com/data/images_big/477.jpg",
        answer: "mouse"),
    Question(
        image: "https://4pics1-word.com/data/images_big/3569.jpg",
        answer: "cart"),
    Question(
        image: "https://4pics1-word.com/data/images_big/476.jpg",
        answer: "key"),
    Question(
        image: "https://4pics1-word.com/data/images_big/3587.jpg",
        answer: "beef"),
  ];

  List<Question> getQuestions() {
    return questions;
  }
}
