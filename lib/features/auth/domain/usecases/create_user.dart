import 'package:tdd_clean_learning/core/usecase/usecase.dart';
import 'package:tdd_clean_learning/core/utils/typedef.dart';

import '../repositories/auth_repo.dart';

class CreateUSer extends UseCase<void, dynamic> {
  final AuthRepository _authRepository;

  const CreateUSer(this._authRepository);
  ResultFuture<void> createUser(
          {required String createdAt,
          required String name,
          required String avatar}) async =>
      _authRepository.createUser(
          createdAt: createdAt, name: name, avatar: avatar);

  @override
  ResultFuture call(param) {
    throw UnimplementedError();
  }
}
