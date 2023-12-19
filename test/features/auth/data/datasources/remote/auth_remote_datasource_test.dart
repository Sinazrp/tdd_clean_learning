import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
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
    });
    test('should throw api exceptiobn', () {
      when(() => client.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => http.Response('faild to created', 500));
    });
  });
}
