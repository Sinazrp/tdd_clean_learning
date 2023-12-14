import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_learning/features/auth/domain/repositories/auth_repo.dart';
import 'package:tdd_clean_learning/features/auth/domain/usecases/create_user.dart';

class MockAuthRepo extends Mock implements AuthRepository {}

void main() {
  late CreateUser useCase;
  late AuthRepository repository;
  setUp(() {
    repository = MockAuthRepo();
    useCase = CreateUser(repository);
  });
  test('should call the [AuthRepo.createUser]', () async {
    // Arrangement
    const params = CreateUserParams(
        avatar: 'avatar-1.jpg', createdAt: 'created at now', name: 'hilarooda');

    //act
    useCase(params);
    //assert
  });
}
