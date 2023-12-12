import 'package:tdd_clean_learning/core/utils/typedef.dart';
import 'package:tdd_clean_learning/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  const AuthRepository();
  ResultFuture<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar});
  ResultFuture<List<User>> getUsers();
}
