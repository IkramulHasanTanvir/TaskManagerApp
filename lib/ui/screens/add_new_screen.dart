import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widgets/screens_background.dart';

class AddNewScreen extends StatelessWidget {
  const AddNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56),
          Text(
            'Add New Task',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 24),
          _buildAddNewForm(),
        ],
      ),
    );
  }

  Widget _buildAddNewForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Subject'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          maxLines: 8,
          decoration: const InputDecoration(hintText: 'Description'),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onTapAddButton,
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  void _onTapAddButton() {}
}
