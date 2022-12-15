// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter_test/flutter_test.dart';
import 'package:mobii_exam_clean/src/data/data_sources/user/user_data_source.dart';
import 'package:mobii_exam_clean/src/data/models/user/user_model.dart';
import 'package:mobii_exam_clean/src/data/repositories/user/user_repository_impl.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/data_entities.dart';
import '../../../helpers/data_models.dart';
import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([UserDataSourceImpl])
void main() {
  final dataSource = MockUserDataSourceImpl();
  final repository = UsersRepositoryImpl(
    dataSource,
  );

  test(
    '| Should return List<UserEntity> when the response is 200 (success).',
    () async {
      // Arrange
      when(dataSource.getUsers()).thenAnswer(
        (_) => Future<List<UserModel>>.value(DataModels.listUsers),
      );

      // Act
      final result = await repository.getUsers();

      List<UserEntity>? returnedRight;

      result.fold((l) => null, (r) {
        returnedRight = r;
      });

      // Assert
      expect(returnedRight, equals(DataEntities.listUsersEntities));
      verify(dataSource.getUsers());
    },
  );
}
