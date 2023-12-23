part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class CreateUserEvent extends AuthEvent {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserEvent(
      {required this.createdAt, required this.name, required this.avatar});

  @override
  List<Object?> get props => [createdAt, name, avatar];
}

class GetUserEvent extends AuthEvent {
  const GetUserEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
