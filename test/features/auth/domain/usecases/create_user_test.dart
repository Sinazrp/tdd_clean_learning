import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_learning/features/auth/domain/repositories/auth_repo.dart';
import 'package:tdd_clean_learning/features/auth/domain/usecases/create_user.dart';
import 'auth_repo.mock.dart';

void main() {
  late CreateUser useCase;
  late AuthRepository repository;
  const params = CreateUserParams.empty();
  setUp(() {
    repository = MockAuthRepo();
    useCase = CreateUser(repository);
  });
  test('should call the [AuthRepo.createUser]', () async {
    // Arrangement
    when(
      () => repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar')),
    ).thenAnswer((_) async => const Right(null));

    //act
    final result = await useCase(params);

    //assert
    expect(result, equals(const Right<dynamic, void>(null)));

    verify(() => repository.createUser(
        avatar: params.avatar,
        name: params.name,
        createdAt: params.createdAt)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
