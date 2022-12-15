import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';

part 'users_entity.freezed.dart';

@freezed
class UsersEntity with _$UsersEntity {
  factory UsersEntity({
    required List<UserEntity> users,
  }) = _UserEntity;
}
