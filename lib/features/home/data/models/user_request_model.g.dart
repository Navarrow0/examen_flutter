// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestModel _$UserRequestModelFromJson(Map<String, dynamic> json) =>
    UserRequestModel(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      edad: (json['edad'] as num).toInt(),
    );

Map<String, dynamic> _$UserRequestModelToJson(UserRequestModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['email'] = instance.email;
  val['name'] = instance.name;
  val['edad'] = instance.edad;
  return val;
}
