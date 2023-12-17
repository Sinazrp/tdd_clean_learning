import 'package:tdd_clean_learning/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar});

  Future<List<UserModel>> getUsers();
}
