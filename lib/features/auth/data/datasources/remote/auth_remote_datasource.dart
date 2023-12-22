import 'dart:convert';

import 'package:tdd_clean_learning/core/errors/exceptions.dart';
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
    try {
      final response = await _client.post(Uri.parse('$baseUrl/users'),
          body: jsonEncode({
            'avatar': avatar,
            'createdAt': createdAt,
            'name': name,
          }));
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(
            message: response.body, statusCode: response.statusCode);
      }
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() {
    throw UnimplementedError();
  }
}
