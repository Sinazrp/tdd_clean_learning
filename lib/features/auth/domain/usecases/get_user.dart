import 'package:dartz/dartz.dart';
import 'package:tdd_clean_learning/core/errors/failure.dart';
import 'package:tdd_clean_learning/core/usecase/usecase.dart';
import 'package:tdd_clean_learning/core/utils/typedef.dart';
import 'package:tdd_clean_learning/features/auth/domain/entities/user.dart';
import 'package:tdd_clean_learning/features/auth/domain/repositories/auth_repo.dart';

class GetUser implements UseCaseVoid<Either<Failure, List<User>>> {
  final AuthRepository _authRepository;
  GetUser(this._authRepository);
  @override
  ResultFuture<List<User>> call() async {
    return await _authRepository.getUsers();
  }
}
