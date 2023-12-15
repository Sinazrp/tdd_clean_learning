import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_learning/features/auth/domain/repositories/auth_repo.dart';
import 'package:tdd_clean_learning/features/auth/domain/usecases/get_user.dart';

import 'usecase_mocks.dart';

void main() {
  late final GetUser useCase;
  late final AuthRepository repository;
  setUp(() {
    repository = MockAuthRepo();
    useCase = GetUser(repository);
  });
  test('it should call [Repository.getUser()]', () {
    //Arrange
    when(() => repository.getUsers()).;

    //act

    // Assert
  });
}
