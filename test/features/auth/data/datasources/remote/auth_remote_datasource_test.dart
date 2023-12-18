import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_learning/features/auth/data/datasources/remote/auth_remote_datasource.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late AuthRemoteDataSource remoteDataSource;
  setUp(() {
    client = MockHttpClient();
    remoteDataSource = AuthRemoteDataSourceImple(client);
  });
  group('createUser', () {});
}
