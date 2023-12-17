import 'package:tdd_clean_learning/core/utils/typedef.dart';
import 'package:tdd_clean_learning/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tdd_clean_learning/features/auth/domain/entities/user.dart';
import 'package:tdd_clean_learning/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImplementation implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImplementation(this._remoteDataSource);
  @override
  ResultFuture<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar}) {
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUsers() {
    throw UnimplementedError();
  }
}
