

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ResponseHandler {
  static Either<String, T> handle<T>(Response<dynamic> response, T Function(dynamic json) fromJson) {
    if (response.data is Map) {
      final data = response.data as Map<String, dynamic>;
      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204 || data.containsKey('success') && data['success'] == true && response.statusCode == 201) {
        return Right(fromJson(response.data));
      } else {
        final errors = response.data['errors'];

        if (errors != null) {
          String errorMessages;

          if (errors is Map) {
            final Map<String, dynamic> errorsMap = Map<String, dynamic>.from(errors);
            errorMessages = JSONKeyIterator(errorsMap).iterateValues().join('\n');
          } else if (errors is String) {
            errorMessages = errors;
          } else if (errors is List) {
            errorMessages = errors.join('\n');
          } else {
            errorMessages = 'Error desconocido';
          }

          return Left(errorMessages);
        } else {
          final errorMessage = response.data['error'] ?? response.data['message'] ?? 'Error desconocido';
          return Left(errorMessage);
        }
      }
    } else {
      return const Left('Respuesta inesperada del servidor');
    }

  }
}


class JSONKeyIterator {
  final Map<String, dynamic> json;

  JSONKeyIterator(this.json);

  Iterable<String> iterateValues() sync* {
    for (var value in json.values) {
      yield* _iterate(value);
    }
  }

  Iterable<String> _iterate(dynamic value) sync* {
    if (value is Map<String, dynamic>) {
      yield* JSONKeyIterator(value).iterateValues();
    } else if (value is Iterable) {
      for (var item in value) {
        yield* _iterate(item);
      }
    } else {
      yield value.toString();
    }
  }
}
