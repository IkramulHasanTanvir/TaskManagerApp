import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TaskSummaryCard(),
      ],
    );
  }
}

