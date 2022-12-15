import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobii_exam_clean/src/core/service/failure/failure.dart';
import 'package:mobii_exam_clean/src/domain/use_cases/user/get_users_usecase.dart';
import 'package:mobii_exam_clean/src/presentation/cubits/user_list/users_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/data_entities.dart';
import 'users_cubit_test.mocks.dart';

@GenerateMocks([GetUsersUseCase])
void main() {
  final getUsersUseCase = MockGetUsersUseCase();
  final cubit = UsersCubit(getUsersUseCase);

  test(
    '| Should emit [loading, success] when getting users.',
    () {
      // Arrange
      when(getUsersUseCase.call()).thenAnswer(
        (_) async => Right(DataEntities.listUsersEntities),
      );

      final expected = [
        UserState.loading(),
        UserState.success(
          DataEntities.listUsersEntities,
        ),
      ];

      // Assert
      expectLater(cubit.stream, emitsInOrder(expected));

      // Act
      cubit.getUsers();
    },
  );

  test(
    '| Should emit [loading, failure] indicating an unknown error when getting users.',
    () {
      // Arrange
      when(getUsersUseCase.call()).thenAnswer(
        (_) async => const Left(UnknownFailure(message: 'Unknown Error')),
      );

      final expected = [
        UserState.loading(),
        UserState.failure('Unknown Error'),
      ];

      // Assert
      expectLater(cubit.stream, emitsInOrder(expected));

      // Act
      cubit.getUsers();
    },
  );
}
