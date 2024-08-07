import 'package:animations/features/number_trivia/data/datasources/number_trivia_model.dart';
import 'package:animations/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: "Test text");

  test(
    "Should be a a subclass of numberTriviaEntity",
    () {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );
}
