import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  GetRandomNumberTrivia(this.repository);
  final NumberTriviaRepository repository;

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams param) async {
    return await repository.getRandomNumberTrivia();
  }
}
