import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';
import 'package:task_manager_app/ui/utils/app_texts.dart';
import 'package:task_manager_app/ui/widgets/custom_scaffold.dart';
import 'package:task_manager_app/ui/widgets/custom_text_form_field.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Join With Us',
            style: AppTexts.headlineText,
          ),
          const SizedBox(height: 16),
          _buildSingUpForm(),
          const SizedBox(height: 16),
          Center(
            child: _buildHaveAccountSection(),
          ),
        ],
      ),
    );
  }

  // sing up from here
  Widget _buildSingUpForm() {
    return Column(
      children: [
        const CustomTextFormField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const CustomTextFormField(
          hintText: 'First Name',
        ),
        const CustomTextFormField(
          hintText: 'Last Name',
        ),
        const CustomTextFormField(
          hintText: 'Phone Number',
          keyboardType: TextInputType.phone,
        ),
        const CustomTextFormField(
          hintText: 'Password',
          obscureText: true,
        ),
        ElevatedButton(
          onPressed: _onTapSingUp,
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
        ),
      ],
    );
  }

  void _onTapSingUp() {
    //TODO: implement an tap sing up
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
    Navigator.pop(context);
  }
}
