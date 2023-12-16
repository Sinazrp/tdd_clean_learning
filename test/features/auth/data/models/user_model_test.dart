import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_learning/features/auth/data/models/user_model.dart';
import 'package:tdd_clean_learning/features/auth/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test('should be subclass of [User] entity ', () {
    //Arrange

    //Act : no action

    // assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson);
  group('from map ', () {
    test('should return a [UserModel] with the right data ', () {
      //Arrange

      //act
      final result = UserModel.fromMap(tMap);

      //assert
      expect(result, equals(tModel));
    });
  });
}
