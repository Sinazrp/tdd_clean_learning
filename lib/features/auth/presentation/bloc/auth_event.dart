part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class CreateUserEvent extends AuthEvent {
  final String cretedAt;
  final String name;
  final String avatar;

  const CreateUserEvent(
      {required this.cretedAt, required this.name, required this.avatar});

  @override
  List<Object?> get props => [cretedAt, name, avatar];
}

class GetUserEvent extends AuthEvent {
  const GetUserEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
