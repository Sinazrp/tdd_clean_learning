import 'dart:convert';

import 'package:tdd_clean_learning/core/utils/consts.dart';
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
      required String avatar}) async {
    await _client.post(Uri.parse('$baseUrl/users'),
        body: jsonEncode({
          'avatar': avatar,
          'createdAt': createdAt,
          'name': name,
        }));
  }

  @override
  Future<List<UserModel>> getUsers() {
    throw UnimplementedError();
  }
}
