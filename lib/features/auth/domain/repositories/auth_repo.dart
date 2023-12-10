import 'package:tdd_clean_learning/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  const AuthRepository();
  Future<(Exception, void)> createUser(
      {required String createdAt,
      required String name,
      required String avatar});
  Future<(Exception, List<User>)> getUsers();
}
