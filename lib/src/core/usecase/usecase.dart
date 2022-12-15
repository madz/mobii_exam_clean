import 'package:dartz/dartz.dart';
import 'package:mobii_exam_clean/src/core/service/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseNoParam<Type> {
  Future<Either<Failure, Type>> call();
}

abstract class UseCaseSingleReturn<Type> {
  Future<Type> call();
}
