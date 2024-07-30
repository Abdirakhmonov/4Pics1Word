import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_86/ui/widgets/calculator.dart';

void main() {
  test("Calculatorni ayrish funksiyasi: ", () {
    final calculator = Calculator();

    int result = calculator.subtract(10, 5);
    expect(result, 5);

    int result2 = calculator.subtract(11, 5);
    expect(result2, 6);

    int result3 = calculator.subtract(45, 45);
    expect(result3, 0);

    int result4 = calculator.subtract(10, 5);
    expect(result4, 5);
  });
}
