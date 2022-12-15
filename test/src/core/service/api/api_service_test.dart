import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mobii_exam_clean/src/core/service/api/api_service.dart';
import 'package:mobii_exam_clean/src/data/models/user/user_model.dart';
import 'package:mobii_exam_clean/src/shared/constants/app_constants.dart';

import '../../../helpers/chopper_test_client.dart';
import '../../../helpers/data_models.dart';
import '../../../helpers/data_response_file_paths.dart';
import '../../../helpers/json_reader.dart';

void main() {
  final mockApiService = ChopperTestClient();
  test(
    'get list of users',
    () async {
      final mockClient = MockClient((request) async {
        expect(
          request.url.toString(),
          equals(AppConstants.baseUrl),
        );

        expect(request.method, equals('GET'));

        return http.Response(
          jsonReader(DataResponseFilePaths.usersPath),
          200,
        );
      });

      final client = mockApiService.buildMockClient(
        client: mockClient,
        services: [
          ApiService.create(),
        ],
      );

      final apiService = client.getService<ApiService>();

      final response = await apiService.getUsers();

      final result = List<UserModel>.from(
        response.body!.map((model) => UserModel.fromJson(model.toJson())),
      );

      expect(
        result,
        equals(DataModels.listUsers),
      );

      expect(response.statusCode, equals(200));

      mockClient.close();
    },
  );
}
