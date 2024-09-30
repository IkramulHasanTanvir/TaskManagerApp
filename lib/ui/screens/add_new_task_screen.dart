import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/utils/app_texts.dart';
import 'package:task_manager_app/ui/widgets/custom_app_bar.dart';
import 'package:task_manager_app/ui/widgets/custom_scaffold.dart';
import 'package:task_manager_app/ui/widgets/custom_text_form_field.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56),
          const Text(
            'Add New Task',
            style: AppTexts.headlineText,
          ),
          const SizedBox(height: 24),
          const CustomTextFormField(hintText: 'Subject'),
          const CustomTextFormField(
            maxLines: 6,
            hintText: 'Description',
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _onTapAddNewTask,
            child: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
      ),
    );
  }

  void _onTapAddNewTask(){
    //TODO: implement on tap add new task
  }
}
