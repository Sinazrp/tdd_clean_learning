import 'package:tdd_clean_learning/core/errors/exceptions.dart';
import 'package:tdd_clean_learning/core/errors/failure.dart';

/// Represents a failure or error that occurs when making an API call.
class ApiFailure extends Failure {
  const ApiFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
  ApiFailure.fromE({required ServerException e})
      : this(message: e.message, statusCode: e.statusCode);
}
