import 'package:tdd_clean_learning/core/errors/failure.dart';

class ApiFailure extends Failure {
  ApiFailure({required super.message, required super.statusCode});
}
