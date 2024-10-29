
import 'package:examen_flutter/features/home/data/models/user_request_model.dart';

class UserResponseEntity {
  final List<UserDataEntity> data;
  final String message;
  final int status;

  UserResponseEntity({
    required this.data,
    required this.message,
    required this.status
  });

}

class UserDataEntity {
  int? id;
  String name;
  String email;
  int edad;

  UserDataEntity({
    this.id,
    required this.name,
    required this.email,
    required this.edad
  });


  UserRequestModel toModel() {
    return UserRequestModel(
      id: id,
        name: name,
        email: email,
        edad: edad
    );
  }
}