import 'package:tdd_clean_learning/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar});

  Future<List<UserModel>> getUsers();
}

class AuthRemoteDataSourceImple implements AuthRemoteDataSource {
  final http.Client _client;

  AuthRemoteDataSourceImple(this._client);

  @override
  Future<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar}) {
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsers() {
    throw UnimplementedError();
  }
}
