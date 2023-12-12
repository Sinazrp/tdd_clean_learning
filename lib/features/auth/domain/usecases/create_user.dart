import 'package:equatable/equatable.dart';

import 'package:tdd_clean_learning/core/usecase/usecase.dart';
import 'package:tdd_clean_learning/core/utils/typedef.dart';

import '../repositories/auth_repo.dart';

class CreateUser extends UseCase<void, CreateUserParams> {
  final AuthRepository _authRepository;
  CreateUser(this._authRepository);

  @override
  Future<void> call(CreateUserParams params) {
    return _authRepository.createUser(
        createdAt: params.createdAt, name: params.name, avatar: params.avatar);
  }
}

class CreateUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams(
      {required this.createdAt, required this.name, required this.avatar});

  @override
  List<Object> get props => [createdAt, name, avatar];
}
