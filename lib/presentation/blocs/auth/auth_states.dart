import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class InitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SendingAuthData extends AuthState {
  @override
  List<Object?> get props => [];
}

class ErrorSendingAuthData extends AuthState {
  final String message;

  ErrorSendingAuthData(this.message);
  @override
  List<Object?> get props => [message];
}

class AuthenticatedState extends AuthState {
  final Map authData;

  AuthenticatedState(this.authData);

  @override
  List<Object?> get props => [authData];
}

class CheckingAuth extends AuthState {
  @override
  List<Object?> get props => [];
}
