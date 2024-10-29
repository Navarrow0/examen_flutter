// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_operation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOperationResponseModel _$UserOperationResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserOperationResponseModel(
      data: UserDataModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$UserOperationResponseModelToJson(
        UserOperationResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };
