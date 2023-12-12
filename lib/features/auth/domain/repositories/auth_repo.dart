import 'package:dartz/dartz.dart';
import 'package:tdd_clean_learning/core/errors/failure.dart';
import 'package:tdd_clean_learning/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  const AuthRepository();
  Future<Either<Failure, void>> createUser(
      {required String createdAt,
      required String name,
      required String avatar});
  Future<Either<Failure, List<User>>> getUsers();
}
