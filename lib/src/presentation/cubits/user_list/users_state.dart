part of 'users_cubit.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    String? errorMessage,
    List<UserEntity>? usersEntity,
    @Default(ProcessStatus.none) ProcessStatus status,
  }) = _UserState;

  factory UserState.init() => UserState(status: ProcessStatus.none);

  factory UserState.loading() => UserState(status: ProcessStatus.inProgress);

  factory UserState.success([
    List<UserEntity>? usersEntity,
  ]) =>
      UserState(
        usersEntity: usersEntity,
        status: ProcessStatus.successful,
      );

  factory UserState.failure([String? errorMessage]) => UserState(
        errorMessage: errorMessage,
        status: ProcessStatus.failed,
      );
}
