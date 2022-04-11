import 'package:cncm_flutter_new/presentation/pages/homepage/homepage.dart';
import 'package:cncm_flutter_new/presentation/pages/homepage/tab_element_account.dart';
import 'package:cncm_flutter_new/presentation/pages/login_page.dart';
import 'package:cncm_flutter_new/presentation/pages/welcome_screen.dart';
import 'package:cncm_flutter_new/presentation/pages/splach_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    dynamic args = routeSettings.arguments;
    switch (routeSettings.name) {
      case SplashScreenPage.splachScreenRouteName:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreenPage();
        });
      case WelcomeScreen.welcomeScreenRouteName:
        return MaterialPageRoute(builder: (context) {
          return const WelcomeScreen();
        });

      case LoginPage.loginPageRouteName:
        return MaterialPageRoute(builder: (context) {
          return LoginPage();
        });

      case HomePage.homePageRouteName:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });

      case AccountInfoPage.accountInfoPage:
        return MaterialPageRoute(builder: (context) {
          return AccountInfoPage(
            accountInfo: args['accountInfo'],
          );
        });
    }
  }
}
