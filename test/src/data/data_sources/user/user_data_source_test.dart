import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobii_exam_clean/src/core/service/api/api_service.dart';
import 'package:mobii_exam_clean/src/core/service/exception/api_exception/api_exception.dart';
import 'package:mobii_exam_clean/src/data/data_sources/user/user_data_source.dart';
import 'package:mobii_exam_clean/src/data/models/user/user_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/data_models.dart';
import '../../../helpers/mock_base_response.dart';
import 'user_data_source_test.mocks.dart';

@GenerateMocks([
  ApiService,
])
void main() {
  final client = MockApiService();
  final dataSource = UserDataSourceImpl(
    client,
  );
  test(
    '| Should perform a GET request',
    () async {
      final successResponse = Response(
        MockBaseResponse(200),
        DataModels.listUsers,
      );
      // Arrange
      when(
        client.getUsers(),
      ).thenAnswer(
        (_) => Future<Response<List<UserModel>>>.value(
          successResponse,
        ),
      );

      // Act
      await dataSource.getUsers();

      // Assert
      verify(
        client.getUsers(),
      );
      verifyNoMoreInteractions(client);
    },
  );

  test(
    '| Should throw a ApiException.',
    () async {
      // Arrange
      when(client.getUsers()).thenThrow(
        const ApiException(
          message: 'Error',
        ),
      );

      // Act
      final call = dataSource.getUsers();

      // Assert
      expect(
        () => call,
        throwsA(isA<ApiException>()),
      );
    },
  );
}
