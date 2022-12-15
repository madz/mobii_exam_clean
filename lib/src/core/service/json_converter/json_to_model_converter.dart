import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:mobii_exam_clean/src/core/service/json_converter/json_model_type_parser.dart';

class JsonToModelConverter extends JsonConverter {
  @override
  Response<ResultType> convertResponse<ResultType, Item>(
    Response<dynamic> response,
  ) {
    final jsonRes = super.convertResponse<dynamic, dynamic>(response);
    if (jsonRes.body == null ||
        (jsonRes.body is String && (jsonRes.body as String).isEmpty)) {
      return jsonRes.copyWith(body: null);
    }
    final dynamic body = json.decode(jsonRes.bodyString);
    final dynamic decodedItem = JsonModelTypeParser.decode<Item>(body);

    return jsonRes.copyWith<ResultType>(body: decodedItem as ResultType);
  }
}
