import 'package:cncm_flutter_new/presentation/blocs/auth/auth_bloc.dart';
import 'package:cncm_flutter_new/presentation/blocs/auth/auth_states.dart';
import 'package:cncm_flutter_new/presentation/pages/homepage/homepage.dart';
import 'package:cncm_flutter_new/presentation/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  static const String splachScreenRouteName = 'splash screen route name';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (ctx, state) {
      if (state is AuthenticatedState) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.homePageRouteName, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, WelcomeScreen.welcomeScreenRouteName, (route) => false);
      }
    }, builder: (context, state) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
