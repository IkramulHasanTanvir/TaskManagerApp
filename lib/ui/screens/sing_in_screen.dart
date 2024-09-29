import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/forgot_email_screen.dart';
import 'package:task_manager_app/ui/screens/sing_up_screen.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';
import 'package:task_manager_app/ui/utils/app_texts.dart';
import 'package:task_manager_app/ui/widgets/custom_scaffold.dart';
import 'package:task_manager_app/ui/widgets/custom_text_form_field.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Get Started With',
            style: AppTexts.headlineText,
          ),
          const SizedBox(height: 24),
          _buildSingInForm(),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: _onTapForgotPasswordScreen,
                  child: const Text(
                    'Forgot Password?',
                    style: AppTexts.labelText,
                  ),
                ),
                _buildSingUpSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // sing in from here
  Widget _buildSingInForm() {
    return Column(
      children: [
        const CustomTextFormField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const CustomTextFormField(
          hintText: 'Password',
          obscureText: true,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onTapSingIn,
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
        ),
      ],
    );
  }

  void _onTapSingIn() {
    //TODO: implement an tap sing in
  }

  // forgot password screen here
  void _onTapForgotPasswordScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgotEmailScreen(),
      ),
    );
  }

  // sing up screen here
  Widget _buildSingUpSection() {
    return RichText(
      text: TextSpan(
        style: AppTexts.titleText,
        text: "don't have an account? ",
        children: [
          TextSpan(
            text: 'Sing Up',
            recognizer: TapGestureRecognizer()..onTap = _onTapSingUpScreen,
            style: const TextStyle(
              color: AppColors.themeColor,
            ),
          ),
        ],
      ),
    );
  }

  void _onTapSingUpScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SingUpScreen(),
      ),
    );
  }
}
