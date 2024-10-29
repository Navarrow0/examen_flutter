
import 'package:examen_flutter/features/home/domain/entities/user_response_entity.dart';

class UserOperationResponseEntity {
  final UserDataEntity data;
  final String message;
  final int status;

  UserOperationResponseEntity({
    required this.data,
    required this.message,
    required this.status,
  });

}