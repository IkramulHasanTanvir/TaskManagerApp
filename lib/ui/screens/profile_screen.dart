import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widgets/tm_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(
        isProfileScreenOpen: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update Profile',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 24),
              _buildPhotoPicker(),
              const SizedBox(height: 16),
              _buildUpdateForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPicker() {
    return Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Photo',
                      style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  const Text('Select Photo')
                ],
              ),
            );
  }

  Widget _buildUpdateForm() {
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
          onPressed: _onTapUpdateProfileButton,
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  void _onTapUpdateProfileButton() {}
}
