import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Title',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Text(
              'Task Description',
            ),
            Text(
              'Date: 12/08/2024',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 12),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusChip(),
                _buildButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    return const Chip(
      label: Text('new'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      side: BorderSide(
        color: AppColors.themeColor,
        width: 1.5,
      ),
    );
  }

  Widget _buildButton() {
    return Wrap(
      children: [
        IconButton(
          onPressed: _onTapEditTask,
          icon: const Icon(
            Icons.edit,
            color: AppColors.themeColor,
          ),
        ),
        IconButton(
          onPressed: _onTapDeleteTask,
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  void _onTapEditTask() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Edit Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                'New',
                'Completed',
                'Canceled',
                'Progress',
              ].map((e) {
                return ListTile(
                  title: Text(e),
                );
              }).toList(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Oky'),
              ),
            ],
          );
        });
  }

  void _onTapDeleteTask() {
    //TODO: implement delete task
  }
}
