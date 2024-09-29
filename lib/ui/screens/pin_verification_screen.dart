import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_app/ui/screens/set_password_screen.dart';
import 'package:task_manager_app/ui/screens/sing_in_screen.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';
import 'package:task_manager_app/ui/utils/app_texts.dart';
import 'package:task_manager_app/ui/widgets/custom_scaffold.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PIN Verification',
            style: AppTexts.headlineText,
          ),
          const SizedBox(height: 8),
          const Text(
            'A 6 digit verification pin will send to your email address',
            style: AppTexts.labelText,
          ),
          const SizedBox(height: 16),
          _buildPinVerificationForm(),
          const SizedBox(height: 16),
          Center(
            child: _buildHaveAccountSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildPinVerificationForm() {
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
        ElevatedButton(
          onPressed: _onTapVerify,
          child: const Text('Verify'),
        ),
      ],
    );
  }

  void _onTapVerify() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SetPasswordScreen(),
      ),
    );
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
