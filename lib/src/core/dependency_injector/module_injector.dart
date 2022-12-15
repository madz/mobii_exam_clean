import 'package:injectable/injectable.dart';
import 'package:mobii_exam_clean/src/core/service/api/api_service.dart';

@module
abstract class InjectableModule {
  ApiService get apiService => ApiService.create();
}
