import 'package:cncm_flutter_new/presentation/pages/login_page.dart';
import 'package:cncm_flutter_new/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String welcomeScreenRouteName = 'welcome screen route name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        // color: Colors.green,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            customButton(
              text: 'Login',
              onClick: () {
                Navigator.pushNamed(context, LoginPage.loginPageRouteName);
              },
              backgroundColor: Colors.green,
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            customButton(
              text: 'Register',
              onClick: () {},
              backgroundColor: Colors.white,
              textColor: Colors.green,
              borderColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
