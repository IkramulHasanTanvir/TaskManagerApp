import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/sing_in_screen.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';
import 'package:task_manager_app/ui/widgets/screens_background.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ScreensBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Join With Us',
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            _buildSingUpForm(),
            const SizedBox(height: 56),
            _buildHaveAccountSection(textTheme),
          ],
        ),
    );
  }

  Widget _buildSingUpForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(hintText: 'First Name'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Last Name'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(hintText: 'Mobile'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Password'),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onTapSingUpButton,
          child: const Icon(Icons.arrow_forward_ios),
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
              text: 'have account?  ',
              style: textTheme.titleSmall,
              children: [
                TextSpan(
                  text: 'Sing In',
                  style: const TextStyle(
                    color: AppColors.themeColor,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _onTapInScreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapSingUpButton() {
    //TODO :
  }

  void _onTapInScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SingInScreen(),
        ),
        (value) => false);
  }
}
