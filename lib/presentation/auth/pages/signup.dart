import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/helper/message/display_message.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/common/widgets/reactive_button/reactive_button.dart';
import 'package:netflix/core/configs/theme/app_colors.dart';
import 'package:netflix/domain/auth/usecases/signup.dart';
import 'package:netflix/presentation/auth/pages/signin.dart';
import 'package:netflix/presentation/home/pages/home.dart';

import '../../../data/auth/models/signup_req_params.dart';
import '../../../service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signupText(),
                const SizedBox(height: 30),
                _emailField(),
                const SizedBox(height: 20),
                _passwordField(),
                const SizedBox(height: 20),
                _signinButton(context),
                const SizedBox(height: 20),
                _signinText(context),
              ],
            )
        )
    );
  }
  Widget _signupText() {
    return Text(
      'Sign Up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),

    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(
        hintText: 'Password',
      )
    );
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async {
        sl<SignupUseCase>().call(
          params: SignupReqParams(email: _emailCon.text, password: _passwordCon.text)
        );
      },
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error){
        DisplayMessage.errorMessage(error, context);
      }
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
        TextSpan(
            children: [
              TextSpan(
                  text: "Do you have account?"
              ),
              TextSpan(
                  text: "Sign In",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    AppNavigator.push(context, SigninPage());
                  }
              )
            ]
        )
    );
  }
}

