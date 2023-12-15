import 'dart:convert';

import 'package:tdd_clean_learning/core/utils/typedef.dart';

import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required String id,
      required String createdAt,
      required String name,
      required String avatar})
      : super(id: id, createdAt: createdAt, name: name, avatar: avatar);

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
          avatar: map['avatar'] as String,
          name: map['name'] as String,
          createdAt: map['createdAt'] as String,
          id: map['id'] as String,
        );

  UserModel copyWith({
    String? id,
    String? createdAt,
    String? name,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  DataMap toMap() => {
        'id': id,
        'avatar': avatar,
        'name': name,
        'createdAt': createdAt,
      };
  String toJson() => jsonEncode(toMap());

  const UserModel.empty()
      : this(
            avatar: 'empty.avatar',
            createdAt: 'empty.createdAt',
            name: 'empty.name',
            id: '1');
}
