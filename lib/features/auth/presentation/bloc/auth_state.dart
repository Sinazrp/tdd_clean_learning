part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class CreatingUserState extends AuthState {
  const CreatingUserState();
}

class GettingUserState extends AuthState {}

class UserCreatedState extends AuthState {}

class UsersLoadedState extends AuthState {
  const UsersLoadedState(this.users);
  final List<User> users;
  @override
  //! it is very important to do this on lists for mapping
  List<Object> get props => users.map((e) => e.id).toList();
}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState(this.message);
  @override
  List<String> get props => [message];
}
