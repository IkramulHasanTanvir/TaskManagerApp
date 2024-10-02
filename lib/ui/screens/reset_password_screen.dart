import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/sing_in_screen.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';
import 'package:task_manager_app/ui/widgets/screens_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ScreensBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set Password',
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Minimum length password 8 character with Latter and number combination',
              style: textTheme.bodyLarge?.copyWith(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            _buildSingInForm(),
            const SizedBox(height: 56),
            _buildHaveAccountSection(textTheme),
          ],
        ),
    );
  }

  Widget _buildSingInForm() {
    return Column(
      children: [
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Password'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Confirm Password'),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onTapNextScreen,
          child: const Text('Confirm'),
        ),
      ],
    );
  }

  Widget _buildHaveAccountSection(TextTheme textTheme) {
    return Center(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Have account?  ',
              style: textTheme.titleSmall,
              children: [
                TextSpan(
                  text: 'Sing In',
                  style: const TextStyle(
                    color: AppColors.themeColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = _onTapSingInScreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapSingInScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SingInScreen(),
        ),
        (value) => false);
  }

  void _onTapNextScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SingInScreen(),
        ),
        (value) => false);
  }
}
