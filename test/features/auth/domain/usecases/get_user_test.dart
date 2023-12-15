import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_learning/core/errors/failure.dart';
import 'package:tdd_clean_learning/features/auth/domain/entities/user.dart';
import 'package:tdd_clean_learning/features/auth/domain/repositories/auth_repo.dart';
import 'package:tdd_clean_learning/features/auth/domain/usecases/get_user.dart';

import 'usecase_mocks.dart';

void main() {
  late final GetUser useCase;
  late final AuthRepository repository;
  const user = User.empty();
  setUp(() {
    repository = MockAuthRepo();
    useCase = GetUser(repository);
  });
  test('it should call [Repository.getUser()]', () async {
    //Arrange
    when(() => repository.getUsers())
        .thenAnswer((_) async => const Right<Failure, List<User>>([user]));

    //act
    final result = await useCase();
    // Assert
    expect(result, equals(const Right<Failure, List<User>>([user])));
    verify(() => repository.getUsers()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
