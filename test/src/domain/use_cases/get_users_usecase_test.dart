// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobii_exam_clean/src/data/repositories/user/user_repository_impl.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';
import 'package:mobii_exam_clean/src/domain/use_cases/user/get_users_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/data_entities.dart';
import 'get_users_usecase_test.mocks.dart';

@GenerateMocks([UsersRepositoryImpl])
void main() {
  final repository = MockUsersRepositoryImpl();
  final getUsersUseCase = GetUsersUseCase(repository);

  test(
    'GetUsersUseCase | Should able to get users.',
    () async {
      // Arrange
      when(repository.getUsers()).thenAnswer(
        (_) async => Right(DataEntities.listUsersEntities),
      );

      // Act
      final result = await getUsersUseCase();

      List<UserEntity>? returnedRight;

      result.fold((l) => null, (r) {
        returnedRight = r;
      });

      // Assert
      expect(result, equals(Right(returnedRight)));
      verify(repository.getUsers());
      verifyNoMoreInteractions(repository);
    },
  );
}
