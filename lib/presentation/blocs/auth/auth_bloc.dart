import 'package:cncm_flutter_new/data/repositories/auth_repository.dart';
import 'package:cncm_flutter_new/presentation/blocs/auth/auth_events.dart';
import 'package:cncm_flutter_new/presentation/blocs/auth/auth_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(InitialState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SendAuthData) {
      yield SendingAuthData();
      try {
        var authData = await authRepository.sendLoginData(
            username: event.username, password: event.password);

        debugPrint('$authData');
        if (authData['success']) {
          yield AuthenticatedState(authData['authData']['results']);
          Box authBox = Hive.box('authData');
          await authBox.put('authData', authData['authData']['results']);
          debugPrint(
              'Saved user auth data => ${authData['authData']['results']}');
        } else {
          yield ErrorSendingAuthData('Invalid Credential.');
        }
      } catch (e) {
        debugPrint('$e');
        throw Exception(e);
      }
    } else if (event is CheckAuthOnStartUp) {
      yield CheckingAuth();
      try {
        Box authBox = Hive.box('authData');
        var authData = authBox.get('authData', defaultValue: null);
        yield AuthenticatedState(authData);

        debugPrint('$authData');
        if (authData != null) {
        } else {
          yield ErrorSendingAuthData('Invalid Credential.');
        }
      } catch (e) {
        debugPrint('$e');
        throw Exception(e);
      }
    }
  }
}
