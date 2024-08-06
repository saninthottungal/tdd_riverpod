import 'package:animations/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:animations/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:animations/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  MockNumberTriviaRepository mockNumberTriviarepository =
      MockNumberTriviaRepository();
  GetConcreteNumberTrivia usecase =
      GetConcreteNumberTrivia(mockNumberTriviarepository);
  const tNumber = 1;
  const trivia = NumberTrivia(text: "Test", number: tNumber);

  test(
    "Should get number trivia for the given number",
    () async {
      when(() => mockNumberTriviarepository.getConcreteNumberTrivia(tNumber))
          .thenAnswer(
        (_) async => const Right(trivia),
      );

      final result = await usecase(Params(tNumber));
      expect(result, const Right(trivia));
      verify(() => mockNumberTriviarepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviarepository);
    },
  );
}
