import 'dart:convert';

import 'package:tdd_clean_learning/core/errors/exceptions.dart';
import 'package:tdd_clean_learning/core/utils/consts.dart';
import 'package:tdd_clean_learning/core/utils/typedef.dart';
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
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _client.get(Uri.parse(
        '$baseUrl/users',
      ));
      if (response.statusCode == 200) {
        return List<DataMap>.from(jsonDecode(response.body) as List)
            .map((e) => UserModel.fromMap(e))
            .toList();
      } else {
        throw ServerException(
            message: response.body, statusCode: response.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      ServerException(message: 'Unexpected', statusCode: 555);
    }
    return [];
  }
}
