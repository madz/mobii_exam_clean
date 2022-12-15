import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobii_exam_clean/src/domain/entities/user/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    String? id,
    String? name,
    String? imageUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id ?? '',
      name: name ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}
