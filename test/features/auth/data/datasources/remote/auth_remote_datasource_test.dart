import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_learning/core/errors/exceptions.dart';
import 'package:tdd_clean_learning/core/utils/consts.dart';
import 'package:tdd_clean_learning/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tdd_clean_learning/features/auth/data/models/user_model.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  UserModel tparams = const UserModel.empty();
  late http.Client client;

  late AuthRemoteDataSource remoteDataSource;
  registerFallbackValue(Uri());
  setUp(() {
    client = MockHttpClient();
    remoteDataSource = AuthRemoteDataSourceImple(client);
  });
  group('createUser', () {
    test('should complete successfully', () async {
      when(() => client.post(any(), body: any(named: 'body'))).thenAnswer(
          (_) async => http.Response('Usser Created succesfully', 201));
      final methodCall = remoteDataSource.createUser;

      expect(
          methodCall(
              createdAt: tparams.createdAt,
              name: tparams.name,
              avatar: tparams.avatar),
          completes);
      verify(() => client.post(Uri.parse("$baseUrl/users"),
          body: jsonEncode({
            'avatar': tparams.avatar,
            'createdAt': tparams.createdAt,
            'name': tparams.name,
          }))).called(1);
      verifyNoMoreInteractions(client);
    });
    test('should throw api exceptiobn', () {
      when(() => client.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => http.Response('not valid register', 400));
      final methodcall = remoteDataSource.createUser;
      expect(
          () => methodcall(
              createdAt: tparams.createdAt,
              name: tparams.name,
              avatar: tparams.avatar),
          throwsA(const ServerException(
              message: 'not valid register', statusCode: 400)));
      verify(() => client.post(Uri.parse("$baseUrl/users"),
          body: jsonEncode({
            'avatar': tparams.avatar,
            'createdAt': tparams.createdAt,
            'name': tparams.name,
          }))).called(1);
      verifyNoMoreInteractions(client);
    });
  });
  group('get Users tests', () {
    test('should complete successfully and return List of users', () async {
      //arrange
      const userModelList = [UserModel.empty()];
      when(() => client.get(any())).thenAnswer((_) async =>
          http.Response(jsonEncode([userModelList.first.toMap()]), 200));

      //act
      final result = await remoteDataSource.getUsers();

      expect(result[0], equals(userModelList.first));
      verify(() => client.get(Uri.parse("$baseUrl/users"))).called(1);
      verifyNoMoreInteractions(client);
    });
    test('should throw an exception when status code is not 200', () async {
      //arrange
      when(() => client.get(any())).thenThrow(
          const ServerException(message: 'bad request', statusCode: 523));
      //act
      final methodcall = remoteDataSource.getUsers;

      //assert
      expect(
          methodcall(),
          throwsA(
              const ServerException(message: 'bad request', statusCode: 523)));
      verify(() => client.get(Uri.parse("$baseUrl/users"))).called(1);
      verifyNoMoreInteractions(client);
    });
  });
}
