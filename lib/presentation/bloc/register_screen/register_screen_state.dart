import 'package:InOut/domain/entities/token_entity.dart';
import 'package:InOut/domain/entities/user_entity.dart';

class RegisterScreenState {}

class RegisterUserInintial extends RegisterScreenState {}

class RegisterUserLoading extends RegisterScreenState {}

class RegisterUserLoaded extends RegisterScreenState {
  final UserEntity user;

  RegisterUserLoaded(this.user);
}

class RegisterUserError extends RegisterScreenState {
  final String message;

  RegisterUserError(this.message);
}

class RegisterUserLoginLoaded extends RegisterScreenState {
  final TokenEntity token;

  RegisterUserLoginLoaded(this.token);
}