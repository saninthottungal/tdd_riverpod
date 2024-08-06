import 'package:animations/core/error/failures.dart';
import 'package:animations/core/usecases/usecases.dart';
import 'package:animations/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:animations/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, Params> {
  GetRandomNumberTrivia(this.repository);
  final NumberTriviaRepository repository;

  @override
  Future<Either<Failure, NumberTrivia>> call(Params param) async {
    return await repository.getRandomNumberTrivia();
  }
}

class Params {}
