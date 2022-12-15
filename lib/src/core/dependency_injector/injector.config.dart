// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobii_exam_clean/src/core/dependency_injector/module_injector.dart'
    as _i10;
import 'package:mobii_exam_clean/src/core/service/api/api_service.dart' as _i3;
import 'package:mobii_exam_clean/src/data/data_sources/user/user_data_source.dart'
    as _i5;
import 'package:mobii_exam_clean/src/data/repositories/user/user_repository_impl.dart'
    as _i7;
import 'package:mobii_exam_clean/src/domain/repositories/user/user_list_repository.dart'
    as _i6;
import 'package:mobii_exam_clean/src/domain/use_cases/user/get_users_usecase.dart'
    as _i8;
import 'package:mobii_exam_clean/src/presentation/cubits/user_list/users_cubit.dart'
    as _i9;
import 'package:mobii_exam_clean/src/shared/router/app_router.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.factory<_i3.ApiService>(() => injectableModule.apiService);
  gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
  gh.factory<_i5.UserDataSource>(
      () => _i5.UserDataSourceImpl(get<_i3.ApiService>()));
  gh.factory<_i6.UserListRepository>(
      () => _i7.UsersRepositoryImpl(get<_i5.UserDataSource>()));
  gh.lazySingleton<_i8.GetUsersUseCase>(
      () => _i8.GetUsersUseCase(get<_i6.UserListRepository>()));
  gh.lazySingleton<_i9.UsersCubit>(
      () => _i9.UsersCubit(get<_i8.GetUsersUseCase>()));
  return get;
}

class _$InjectableModule extends _i10.InjectableModule {}
