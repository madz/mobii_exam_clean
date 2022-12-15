import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobii_exam_clean/src/core/service/exception/api_exception/api_exception.dart';
import 'package:mobii_exam_clean/src/core/service/failure/failure.dart';
import 'package:mobii_exam_clean/src/data/data_sources/user/user_data_source.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';
import 'package:mobii_exam_clean/src/domain/repositories/user/user_list_repository.dart';

@Injectable(as: UserListRepository)
@lazySingleton
class UsersRepositoryImpl implements UserListRepository {
  UsersRepositoryImpl(this._userDataSource);

  final UserDataSource _userDataSource;

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      final response = await _userDataSource.getUsers();

      final listEntity = response
          .map(
            (model) => UserEntity(
              id: model.id!,
              name: model.name!,
              imageUrl: model.imageUrl!,
            ),
          )
          .toList();

      return Right(listEntity);
    } on ApiException catch (e) {
      return Left(
        UnknownFailure(
          message:
              e.message ?? 'There was a problem in getting the API response.',
        ),
      );
    }
  }
}
