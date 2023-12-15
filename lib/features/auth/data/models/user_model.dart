import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(int id, String createdAt, String name, String avatar)
      : super(id: id, createdAt: createdAt, name: name, avatar: avatar);
}
