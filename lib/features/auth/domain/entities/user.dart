import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String createdAt;
  final String name;
  final String avatar;

  const User(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.avatar});
  const User.empty()
      : this(
            avatar: 'empty.avatar',
            createdAt: 'empty.createdAt',
            name: 'empty.name',
            id: 1);

  @override
  List<Object?> get props => [id, createdAt, name, avatar];
}
