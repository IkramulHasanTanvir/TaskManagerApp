import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/sing_in_screen.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';
import 'package:task_manager_app/ui/utils/app_texts.dart';
import 'package:task_manager_app/ui/widgets/custom_scaffold.dart';
import 'package:task_manager_app/ui/widgets/custom_text_form_field.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Set Password',
            style: AppTexts.headlineText,
          ),
          const SizedBox(height: 8),
          const Text(
            'Minimum length password 8 character with Latter and number combination',
            style: AppTexts.labelText,
          ),
          const SizedBox(height: 16),
          _buildSetPasswordForm(),
          const SizedBox(height: 16),
          Center(
            child: _buildHaveAccountSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildSetPasswordForm() {
    return Column(
      children: [
        const CustomTextFormField(
          hintText: 'Password',
          obscureText: true,
        ),
        const CustomTextFormField(
          hintText: 'Confirm Password',
          obscureText: true,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onTapConfirm,
          child: const Text('Confirm'),
          ),
      ],
    );
  }

  void _onTapConfirm() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SingInScreen(),
        ),
            (_) => false);
    //TODO: implement an tap sing in
  }

  Widget _buildHaveAccountSection() {
    return RichText(
      text: TextSpan(
        style: AppTexts.titleText,
        text: "Have account? ",
        children: [
          TextSpan(
            text: 'Sing In',
            recognizer: TapGestureRecognizer()..onTap = _onTapSingInScreen,
            style: const TextStyle(
              color: AppColors.themeColor,
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
            (_) => false);
  }
}
