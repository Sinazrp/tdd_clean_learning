import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_learning/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tdd_clean_learning/features/auth/data/models/user_model.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  UserModel tparams = const UserModel.empty();
  late http.Client client;
  late AuthRemoteDataSource remoteDataSource;
  setUp(() {
    client = MockHttpClient();
    remoteDataSource = AuthRemoteDataSourceImple(client);
  });
  group('createUser', () {
    test('should complete successfully', () async {
      when(() => client.post(any(), body: any(named: 'body'))).thenAnswer(
          (_) async => http.Response('Usser Created succesfully', 201));
      final methodCall = await remoteDataSource.createUser;

      expect(
          methodCall(
              createdAt: tparams.createdAt,
              name: tparams.name,
              avatar: tparams.avatar),
          completes);
    });
  });
}
