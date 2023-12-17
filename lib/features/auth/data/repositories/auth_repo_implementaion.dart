import 'package:tdd_clean_learning/core/utils/typedef.dart';
import 'package:tdd_clean_learning/features/auth/domain/entities/user.dart';
import 'package:tdd_clean_learning/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImplementation implements AuthRepository {
  @override
  ResultFuture<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
