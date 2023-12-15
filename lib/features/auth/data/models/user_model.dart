import 'package:tdd_clean_learning/core/utils/typedef.dart';

import '../../domain/entities/user.dart';

class UserModel extends User {
  //const  UserModel({required super.id, required super.createdAt, required super.name, required super.avatar});
  const UserModel(
      {required id,
      required String createdAt,
      required name,
      required String avatar})
      : super(id: id, createdAt: createdAt, name: name, avatar: avatar);

  UserModel.fromMap(DataMap map)
      : this(
            avatar: map['avatar'],
            name: map['name'],
            createdAt: map['createdAt'],
            id: map['id']);
}
