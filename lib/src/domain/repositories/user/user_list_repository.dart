import 'package:dartz/dartz.dart';
import 'package:mobii_exam_clean/src/core/service/failure/failure.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';

abstract class UserListRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers();
}
