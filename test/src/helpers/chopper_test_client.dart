import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:mobii_exam_clean/src/core/service/json_converter/json_to_model_converter.dart';
import 'package:mobii_exam_clean/src/shared/constants/app_constants.dart';

class ChopperTestClient {
  /// This will create a mock client for your api services.
  ChopperClient buildMockClient({
    http.Client? client,
    List<ChopperService> services = const <ChopperService>[],
  }) {
    return ChopperClient(
      baseUrl: AppConstants.baseUrl,
      services: services,
      client: client,
      converter: JsonToModelConverter(),
    );
  }
}
