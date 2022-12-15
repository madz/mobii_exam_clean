import 'package:injectable/injectable.dart';
import 'package:mobii_exam_clean/src/core/service/api/api_service.dart';
import 'package:mobii_exam_clean/src/core/service/exception/api_exception/api_exception.dart';
import 'package:mobii_exam_clean/src/data/models/user/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUsers();
}

@Injectable(as: UserDataSource)
@lazySingleton
class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl(
    this._apiService,
  );
  final ApiService _apiService;
  @override
  Future<List<UserModel>> getUsers() async {
    final response = await _apiService.getUsers();

    if (response.isSuccessful) {
      return response.body!;
    }

    throw const ApiException();
  }
}
