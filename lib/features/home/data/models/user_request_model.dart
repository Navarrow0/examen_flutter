import 'package:json_annotation/json_annotation.dart';

part 'user_request_model.g.dart';

@JsonSerializable()
class UserRequestModel {
  @JsonKey(
    includeIfNull: false
  )
  final int? id;
  final String email;
  final String name;
  final int edad;

  UserRequestModel({
    this.id,
    required this.email,
    required this.name,
    required this.edad,
  });

  factory UserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestModelToJson(this);

}
