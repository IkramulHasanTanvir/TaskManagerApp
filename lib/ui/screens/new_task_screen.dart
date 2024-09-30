import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/add_new_task_screen.dart';
import 'package:task_manager_app/ui/widgets/custom_scaffold.dart';
import 'package:task_manager_app/ui/widgets/task_summaryCard.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: const CircleBorder(),
        onPressed: _onTapFAB,
        child: const Icon(Icons.add),
      ),
      body: const Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TaskSummaryCard(
                  count: 9,
                  title: 'New',
                ),
                TaskSummaryCard(
                  count: 4,
                  title: 'Completed',
                ),
                TaskSummaryCard(
                  count: 7,
                  title: 'Canceled',
                ),
                TaskSummaryCard(
                  count: 0,
                  title: 'Progress',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapFAB() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );
  }
}
