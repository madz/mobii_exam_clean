import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobii_exam_clean/src/core/service/failure/failure.dart';
import 'package:mobii_exam_clean/src/core/usecase/usecase.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';
import 'package:mobii_exam_clean/src/domain/repositories/user/user_list_repository.dart';

@lazySingleton
class GetUsersUseCase extends UseCaseNoParam<List<UserEntity>> {
  GetUsersUseCase(this._usersRepository);
  final UserListRepository _usersRepository;

  @override
  Future<Either<Failure, List<UserEntity>>> call() =>
      _usersRepository.getUsers();
}
