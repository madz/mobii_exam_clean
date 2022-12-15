import 'package:mobii_exam_clean/src/core/service/json_converter/json_exceptions.dart';
import 'package:mobii_exam_clean/src/data/models/user/user_model.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonModelTypeParser {
  static const factories = {
    UserModel: UserModel.fromJson,
  };

  static dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) return _decodeList<T>(entity);

    if (entity is Map<String, dynamic>) return _decodeMap<T>(entity);

    return entity;
  }

  static T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      /// throw serializer not found error;
      throw JsonFactoryNotFoundException(T.toString());
    }

    // ignore: unnecessary_cast
    return jsonFactory(values) as T;
  }

  static List<T> _decodeList<T>(Iterable<dynamic> values) => values
      .where((dynamic v) => v != null)
      .map((dynamic v) => decode<T>(v) as T)
      .toList();
}
