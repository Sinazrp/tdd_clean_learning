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
    const tModel1 = UserModel.empty();
    //Act : no action

    // assert
    expect(tModel1, isA<User>());
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

  group('from json ', () {
    test('should return a [UserModel] with the right data ', () {
      //Arrange

      //act
      final result = UserModel.fromJson(tJson);

      //assert
      expect(result, equals(tModel));
    });
  });

  group(' to map', () {
    test('should return a [Map]', () {
      //act
      final result = tModel.toMap();

      //assert
      expect(result, equals(tMap));
    });
  });

  group('tojson', () {
    test('should return a json ', () {
      //act
      final result = tModel.toJson();

      //assert
      expect(result, equals(tJson));
    });
  });

  group('copywith', () {
    test('should return [Model.copyWith param]', () {
      //act
      final result = tModel.copyWith(name: 'sina');

      // assert
      expect(result.name, equals('sina'));
    });
  });
}
