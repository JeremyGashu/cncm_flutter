import 'package:cncm_flutter_new/presentation/blocs/auth/auth_bloc.dart';
import 'package:cncm_flutter_new/presentation/blocs/auth/auth_events.dart';
import 'package:cncm_flutter_new/presentation/blocs/auth/auth_states.dart';
import 'package:cncm_flutter_new/presentation/pages/homepage/homepage.dart';
import 'package:cncm_flutter_new/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  static const String loginPageRouteName = 'login page route name';
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
            if (state is AuthenticatedState) {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomePage.homePageRouteName, (route) => false);
            } else if (state is ErrorSendingAuthData) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                  ),
                ),
              );
            }
            debugPrint('$state');
          }, builder: (context, state) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const SizedBox(
                      //   width: 25,
                      // ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),

                      const Text(
                        'Log In',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      const SizedBox(
                        width: 25,
                      ),

                      // const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/logo.svg',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: const Color(0XFFf0f0f0),
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 1),
                            ),
                            hintText: 'Phone Number',
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: const Color(0XFFf0f0f0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 1),
                            ),
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      state is SendingAuthData
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : customButton(
                              text: 'Log In',
                              onClick: () {
                                BlocProvider.of<AuthBloc>(context).add(
                                    SendAuthData(
                                        username:
                                            _usernameController.value.text,
                                        password:
                                            _passwordController.value.text));
                              },
                            ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
