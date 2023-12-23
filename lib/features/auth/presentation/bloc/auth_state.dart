part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class CreatingUser extends AuthState {}

class GettingUser extends AuthState {}

class UserCreated extends AuthState {}

class UsersLoaded extends AuthState {
  const UsersLoaded(this.users);
  final List<UserModel> users;
  @override
  //! it is very important to do this on lists
  List<Object> get props => users.map((e) => e.id).toList();
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
  @override
  List<String> get props => [message];
}
