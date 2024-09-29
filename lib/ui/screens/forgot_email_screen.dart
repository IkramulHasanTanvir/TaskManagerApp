import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/pin_verification_screen.dart';
import 'package:task_manager_app/ui/screens/sing_in_screen.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';
import 'package:task_manager_app/ui/utils/app_texts.dart';
import 'package:task_manager_app/ui/widgets/custom_scaffold.dart';
import 'package:task_manager_app/ui/widgets/custom_text_form_field.dart';

class ForgotEmailScreen extends StatefulWidget {
  const ForgotEmailScreen({super.key});

  @override
  State<ForgotEmailScreen> createState() => _ForgotEmailScreenState();
}

class _ForgotEmailScreenState extends State<ForgotEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Email Address',
            style: AppTexts.headlineText,
          ),
          const SizedBox(height: 8),
          const Text(
            'A 6 digit verification pin will send to your email address',
            style: AppTexts.labelText,
          ),
          const SizedBox(height: 16),
          _buildForgotEmailForm(),
          const SizedBox(height: 16),
          Center(
            child: _buildHaveAccountSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotEmailForm() {
    return Column(
      children: [
        const CustomTextFormField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onTapPinVerificationScreen,
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
        ),
      ],
    );
  }

  void _onTapPinVerificationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PinVerificationScreen(),
      ),
    );
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
