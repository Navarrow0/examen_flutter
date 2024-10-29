import 'package:examen_flutter/features/home/data/models/users_response_model.dart';
import 'package:examen_flutter/features/home/domain/entities/user_operation_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_operation_response_model.g.dart';

@JsonSerializable()
class UserOperationResponseModel {
  final UserDataModel data;
  final String message;
  final int status;

  UserOperationResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory UserOperationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserOperationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserOperationResponseModelToJson(this);

  UserOperationResponseEntity toEntity() {
    return UserOperationResponseEntity(
      data: data.toEntity(),
      message: message,
      status: status
    );
  }
}