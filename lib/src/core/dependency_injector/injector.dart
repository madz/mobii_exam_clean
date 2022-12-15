import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobii_exam_clean/src/core/dependency_injector/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
void configureDependencies(String prod) => $initGetIt(getIt);
