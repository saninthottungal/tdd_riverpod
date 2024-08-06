import 'package:animations/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:animations/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:animations/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late GetRandomNumberTrivia usecase;
  const NumberTrivia trivia = NumberTrivia(text: "test text", number: 1);

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  test(
    "test for random trivia",
    () async {
      when(() => mockNumberTriviaRepository.getRandomNumberTrivia()).thenAnswer(
        (invocation) async => const Right(trivia),
      );
      final result = await usecase(NoParams());
      expect(result, const Right(trivia));
      verify(() => mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
