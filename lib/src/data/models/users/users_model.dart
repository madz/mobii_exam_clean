// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:mobii_exam_clean/src/data/models/user/user_model.dart';
// import 'package:mobii_exam_clean/src/domain/entities/users/users_entity.dart';

// part 'users_model.freezed.dart';
// part 'users_model.g.dart';

// @freezed
// class UsersModel with _$UsersModel {
//   factory UsersModel({
//     List<UserModel>? users,
//   }) = _UsersModel;

//   factory UsersModel.fromJson(Map<String, dynamic> json) =>
//       _$UsersModelFromJson(json);
// }

// extension UsersModelX on UsersModel {
//   UsersEntity toEntity() {
//     return UsersEntity(
//       users: users?.map((e) => e.toEntity()).toList() ?? [],
//     );
//   }
// }
