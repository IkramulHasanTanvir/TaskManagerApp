import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/add_new_screen.dart';
import 'package:task_manager_app/ui/widgets/task_card.dart';
import 'package:task_manager_app/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapFAB,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            _buildTaskSummary(),
            Expanded(
              child: ListView.separated(
                itemCount: 9,
                itemBuilder: (context, index) => const TaskCard(),
                separatorBuilder: (context, index) => const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskSummary() {
    return const Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TaskSummaryCard(
              title: 'New',
              count: 9,
            ),
            TaskSummaryCard(
              title: 'Completed',
              count: 9,
            ),
            TaskSummaryCard(
              title: 'Canceled',
              count: 9,
            ),
            TaskSummaryCard(
              title: 'Progress',
              count: 9,
            ),
          ],
        ),
      ),
    );
  }

  void _onTapFAB() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewScreen(),
      ),
    );
  }
}
