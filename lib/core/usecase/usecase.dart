abstract class UseCaseParams<Type, Params> {
  Future<Type> call(Params params);
}

abstract class UseCaseVoid<Type> {
  Future<Type> call();
}
