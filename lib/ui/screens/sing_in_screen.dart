import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/forgot_email_screen.dart';
import 'package:task_manager_app/ui/screens/sing_up_screen.dart';
import 'package:task_manager_app/ui/screens/task_view/main_bottom_nav_bar.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';
import 'package:task_manager_app/ui/widgets/screens_background.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ScreensBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get Started With',
            style: textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          _buildSingInForm(),
          const SizedBox(height: 56),
          _buildForgotOrAccountSection(textTheme),
        ],
      ),
    );
  }

  Widget _buildSingInForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Password'),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onTapSingInButton,
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  Widget _buildForgotOrAccountSection(TextTheme textTheme) {
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: _onTapForgotScreen,
            child: const Text('Forgot Password?'),
          ),
          RichText(
            text: TextSpan(
              text: "Don't have account?  ",
              style: textTheme.titleSmall,
              children: [
                TextSpan(
                  text: 'Sing Up',
                  style: const TextStyle(
                    color: AppColors.themeColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = _onTapSingUpScreen,
                ),
              ],
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

  void _onTapForgotScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgotEmailScreen(),
      ),
    );
  }

  void _onTapSingInButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainBottomNavBar(),
        ),
        (value) => false);
  }
}
