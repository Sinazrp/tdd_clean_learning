import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_clean_learning/features/auth/domain/entities/user.dart';
import 'package:tdd_clean_learning/features/auth/domain/usecases/create_user.dart';
import 'package:tdd_clean_learning/features/auth/domain/usecases/get_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required CreateUser createUser, required GetUser getUser})
      : _createUser = createUser,
        _getUser = getUser,
        super(const AuthInitial()) {
    on<CreateUserEvent>(_createUserEvent);
    on<GetUserEvent>(_getUserEvent);
  }
  final CreateUser _createUser;
  final GetUser _getUser;

  FutureOr<void> _createUserEvent(
      CreateUserEvent event, Emitter<AuthState> emit) async {
    emit(const CreatingUserState());
    final result = await _createUser(CreateUserParams(
        createdAt: event.createdAt, name: event.name, avatar: event.avatar));
    result.fold((failure) => emit(AuthErrorState(failure.getMessage())),
        (_) => emit(UserCreatedState()));
  }

  FutureOr<void> _getUserEvent(
      GetUserEvent event, Emitter<AuthState> emit) async {
    emit(GettingUserState());
    final result = await _getUser();
    result.fold((failure) => emit(AuthErrorState(failure.message)),
        (usersList) => emit(UsersLoadedState(usersList)));
  }
}
