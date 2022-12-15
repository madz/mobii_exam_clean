import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobii_exam_clean/src/core/service/failure/failure.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';
import 'package:mobii_exam_clean/src/domain/use_cases/user/get_users_usecase.dart';
import 'package:mobii_exam_clean/src/shared/enums/process_status.dart';

part 'users_cubit.freezed.dart';
part 'users_state.dart';

@lazySingleton
class UsersCubit extends Cubit<UserState> {
  UsersCubit(
    this._getUsersUseCase,
  ) : super(UserState.init());

  final GetUsersUseCase _getUsersUseCase;
  Future<void> getUsers() async {
    emit(UserState.loading());

    final either = await _getUsersUseCase.call();
    either.fold(
      (left) {
        if (left is UnknownFailure) {
          emit(UserState.failure(left.message));
        }
      },
      (right) {
        emit(
          UserState.success(right),
        );
      },
    );
  }
}
