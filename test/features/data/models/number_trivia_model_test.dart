import 'dart:convert';

import 'package:animations/features/number_trivia/data/datasources/number_trivia_model.dart';
import 'package:animations/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: "Test text");

  test(
    "Should be a a subclass of numberTriviaEntity",
    () {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group(
    "from Json test",
    () {
      test(
        "Json with number as double",
        () {
          final result = NumberTriviaModel.fromJson(
            jsonDecode(
              fixtureReader("trivia_double.json"),
            ),
          );
          expect(result, tNumberTriviaModel);
        },
      );
      test(
        "json with number as int",
        () {
          final result = NumberTriviaModel.fromJson(
            jsonDecode(
              fixtureReader("trivia.json"),
            ),
          );
          expect(result, tNumberTriviaModel);
        },
      );
    },
  );

  group(
    "to Json",
    () {
      test(
        "to json test",
        () {
          final result = tNumberTriviaModel.toJson();
          final expectedResult = {"text": "Test text", "number": 1};
          expect(result, expectedResult);
        },
      );
    },
  );
}
