import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class SendAuthData extends AuthEvent {
  final String username;
  final String password;

  SendAuthData({required this.username, required this.password});
  @override
  List<Object?> get props => [username, password];
}

class CheckAuthOnStartUp extends AuthEvent {
  @override
  List<Object?> get props => [];
}
