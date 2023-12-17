import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_learning/core/errors/api_failure.dart';
import 'package:tdd_clean_learning/core/errors/exceptions.dart';
import 'package:tdd_clean_learning/core/errors/failure.dart';
import 'package:tdd_clean_learning/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tdd_clean_learning/features/auth/data/models/user_model.dart';
import 'package:tdd_clean_learning/features/auth/data/repositories/auth_repo_implementaion.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRemoteDataSource remote;
  late AuthRepoImplementation repoImple;
  const tParams = UserModel.empty();

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
      final result = await repoImple.createUser(
          createdAt: tParams.createdAt,
          name: tParams.name,
          avatar: tParams.avatar);

      //assert
      expect(
          result,
          equals(const Left<Failure, void>(
              ApiFailure(message: 'unknown error', statusCode: 500))));
    });
  });
  group('getUsers', () {
    test('call the [Auth Remote Data Source] and succes', () async {
//arrange
      when(() => remote.getUsers()).thenAnswer((_) async => [tParams]);

//act
      final result = await repoImple.getUsers();

//assert
      expect(result, isA<Right<Failure, List<UserModel>>>());
      verify(() => remote.getUsers()).called(1);
      verifyNoMoreInteractions(remote);
    });

    test('call getUser and failure response', () async {
      //arrange
      when(() => remote.getUsers()).thenThrow(
          const ServerException(message: 'cake?vageie', statusCode: 500));

      //action
      final result = await repoImple.getUsers();

      //assert
      expect(
          result,
          const Left<Failure, List<UserModel>>(
              ApiFailure(message: 'cake?vageie', statusCode: 500)));
    });
  });
}
