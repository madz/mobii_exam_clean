import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobii_exam_clean/src/data/models/user/user_model.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';

import '../../../helpers/data_response_file_paths.dart';
import '../../../helpers/json_reader.dart';

void main() {
  test(
    'UserEntity.toEntity',
    () {
      /// arrange
      final jsonMap = json.decode(jsonReader(DataResponseFilePaths.usersPath))
          as List<dynamic>;

      final model = UserModel.fromJson(jsonMap[0] as Map<String, dynamic>);

      /// act
      final result = model.toEntity();

      // Assert
      expect(result, isInstanceOf<UserEntity>());
    },
  );
}
