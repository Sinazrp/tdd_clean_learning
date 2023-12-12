import 'package:tdd_clean_learning/core/utils/typedef.dart';

abstract class UseCase<Type, Params> {
  const UseCase();
  ResultFuture<Type> call(Params param);
}
