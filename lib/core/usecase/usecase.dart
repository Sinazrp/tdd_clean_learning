import 'package:tdd_clean_learning/core/utils/typedef.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
