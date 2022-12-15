import 'package:chopper/chopper.dart';
import 'package:mobii_exam_clean/src/core/service/json_converter/json_to_model_converter.dart';
import 'package:mobii_exam_clean/src/data/models/user/user_model.dart';
import 'package:mobii_exam_clean/src/shared/constants/app_constants.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: AppConstants.baseUrl)
abstract class ApiService extends ChopperService {
  static ApiService create() {
    final client = ChopperClient(
      services: [
        _$ApiService(),
      ],
      converter: JsonToModelConverter(),
    );

    return _$ApiService(client);
  }

  @Get(path: '')
  Future<Response<List<UserModel>>> getUsers();
}
