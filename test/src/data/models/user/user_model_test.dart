import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobii_exam_clean/src/data/models/user/user_model.dart';

import '../../../helpers/data_models.dart';
import '../../../helpers/data_response_file_paths.dart';
import '../../../helpers/json_reader.dart';

void main() {
  test(
    'UsersModel.fromJson',
    () {
      /// arrange
      final jsonMap = json.decode(jsonReader(DataResponseFilePaths.usersPath))
          as List<dynamic>;

      /// act
      final result = List<UserModel>.from(
        jsonMap.map<UserModel>((i) {
          return UserModel.fromJson(i as Map<String, dynamic>);
        }),
      );

      /// assert
      expect(result, isInstanceOf<List<UserModel>>());
    },
  );

  test(
    'UsersModel.toJson',
    () async {
      // Act

      final result = List<UserModel>.from(
        DataModels.listUsers.map((model) => UserModel.fromJson(model.toJson())),
      );

      // Arrange
      final expectedMap = json
          .decode(jsonReader(DataResponseFilePaths.usersPath)) as List<dynamic>;

      final expected = List<UserModel>.from(
        expectedMap.map<UserModel>((i) {
          return UserModel.fromJson(i as Map<String, dynamic>);
        }),
      );

      // Assert
      expect(result, equals(expected));
    },
  );
}
