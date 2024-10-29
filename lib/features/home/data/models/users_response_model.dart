
import 'package:examen_flutter/features/home/domain/entities/user_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_response_model.g.dart';

@JsonSerializable()
class UsersResponseModel {
  @JsonKey(defaultValue: [])
  final List<UserDataModel> data;
  final String message;
  final int status;

  UsersResponseModel({
    required this.data,
    required this.message,
    required this.status
  });

  UserResponseEntity toEntity() {
    return UserResponseEntity(
      message: message,
      data: data.map((e) => e.toEntity()).toList(),
      status: status
    );
  }

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) => _$UsersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseModelToJson(this);
}


@JsonSerializable()
class UserDataModel {
  int? id;

  @JsonKey(defaultValue: '')
  String name;

  @JsonKey(defaultValue: '')
  String email;

  @JsonKey(defaultValue: 0)
  int edad;

  UserDataModel({
    this.id,
    required this.name,
    required this.email,
    required this.edad
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);

  UserDataEntity toEntity() {
    return UserDataEntity(
      id: id,
      name: name,
      email: email,
      edad: edad
    );
  }
}