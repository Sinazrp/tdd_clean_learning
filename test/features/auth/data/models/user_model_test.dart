import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_learning/features/auth/data/models/user_model.dart';
import 'package:tdd_clean_learning/features/auth/domain/entities/user.dart';

void main() {
  test('should be subclass of [User] entity ', () {
    //Arrange
    const tModel = UserModel.empty();

    //Act : no action

    // assert
    expect(tModel, isA<User>());
  });
}
