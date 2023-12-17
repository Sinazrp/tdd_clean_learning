import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_learning/core/errors/exceptions.dart';
import 'package:tdd_clean_learning/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tdd_clean_learning/features/auth/data/models/user_model.dart';
import 'package:tdd_clean_learning/features/auth/data/repositories/auth_repo_implementaion.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRemoteDataSource remote;
  late AuthRepoImplementation repoImple;
  final tParams = const UserModel.empty();

  setUp(() {
    remote = MockAuthRemoteDataSource();
    repoImple = AuthRepoImplementation(remote);
  });

  group('Create User ', () {
    test('Call [AuthRemoteDataSource.create and complete call succesful ]',
        () async {
      //Arrange
      when(() => remote.createUser(
              createdAt: any(named: 'createdAt'),
              name: any(named: 'name'),
              avatar: any(named: 'avatar')))
          .thenAnswer((_) async => Future.value());

      //Act
      final result = await repoImple.createUser(
          avatar: tParams.avatar,
          createdAt: tParams.createdAt,
          name: tParams.name);

      //assert
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(() => remote.createUser(
          createdAt: tParams.createdAt,
          name: tParams.name,
          avatar: tParams.avatar)).called(1);
      verifyNoMoreInteractions(remote);
    });
    test('Server Failure', () async {
      //Arange
      when(() => remote.createUser(
              createdAt: any(named: 'createdAt'),
              name: any(named: 'name'),
              avatar: any(named: 'avatar')))
          .thenThrow(
              const ServerException(message: 'unknown error', statusCode: 500));

      //act

      //assert
    });
  });
}
