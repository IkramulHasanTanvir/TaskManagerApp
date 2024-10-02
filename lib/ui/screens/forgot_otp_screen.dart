import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_app/ui/screens/reset_password_screen.dart';
import 'package:task_manager_app/ui/screens/sing_in_screen.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';
import 'package:task_manager_app/ui/widgets/screens_background.dart';

class ForgotOtpScreen extends StatefulWidget {
  const ForgotOtpScreen({super.key});

  @override
  State<ForgotOtpScreen> createState() => _ForgotOtpScreenState();
}

class _ForgotOtpScreenState extends State<ForgotOtpScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ScreensBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PIN Verification',
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'A 6 digit verification pin will send to your email address',
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
        PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          appContext: (context),
          length: 6,
          keyboardType: TextInputType.number,
          enableActiveFill: true,
          enablePinAutofill: true,
          backgroundColor: Colors.transparent,
          pinTheme: PinTheme(
            fieldHeight: 64,
            fieldWidth: 56,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(8),
            inactiveFillColor: Colors.white,
            inactiveColor: Colors.white,
            selectedFillColor: Colors.white,
            selectedColor: Colors.grey,
            activeFillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onTapNextScreen,
          child: const Text('Verify'),
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResetPasswordScreen(),
      ),
    );
  }
}
