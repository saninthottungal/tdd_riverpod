import '../../../../core/usecases/usecases.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  GetConcreteNumberTrivia(this.repository);

  final NumberTriviaRepository repository;

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params {
  Params(this.number);
  final int number;
}
