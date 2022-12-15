import 'package:http/http.dart' as http;

class MockBaseResponse extends http.BaseResponse {
  MockBaseResponse(super.statusCode);
}
