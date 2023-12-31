import 'package:dartz/dartz.dart';
import 'package:tdd_clean_learning/core/errors/api_failure.dart';
import 'package:tdd_clean_learning/core/errors/exceptions.dart';
import 'package:tdd_clean_learning/core/errors/failure.dart';
import 'package:tdd_clean_learning/core/utils/typedef.dart';
import 'package:tdd_clean_learning/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tdd_clean_learning/features/auth/data/models/user_model.dart';
import 'package:tdd_clean_learning/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImplementation implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImplementation(this._remoteDataSource);
  @override
  ResultFuture<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    try {
      await _remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      return const Right<Failure, void>(null);
    } on ServerException catch (e) {
      return Left<Failure, void>(ApiFailure.fromE(e: e));
    }
  }

  @override
  ResultFuture<List<UserModel>> getUsers() async {
    try {
      final result = await _remoteDataSource.getUsers();
      return Right<Failure, List<UserModel>>(result);
    } on ServerException catch (e) {
      return Left(ApiFailure.fromE(e: e));
    }
  }
}
