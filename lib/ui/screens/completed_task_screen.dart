import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/models/task_list_model.dart';
import 'package:task_manager_app/data/models/task_model.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utils/urls.dart';
import 'package:task_manager_app/ui/widgets/snack_bar_message.dart';
import 'package:task_manager_app/ui/widgets/task_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  List<TaskModel> _completedTaskList = [];
  bool _completedTaskInProgress = false;

  @override
  void initState() {
    super.initState();
    _getCompletedTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Visibility(
        visible: !_completedTaskInProgress,
        replacement: const Center(child: CircularProgressIndicator()),
        child: RefreshIndicator(
          onRefresh: () async {
            _getCompletedTaskList();
          },
          child: ListView.builder(
            itemCount: _completedTaskList.length,
            itemBuilder: (context, index) => TaskCard(
              taskModel: _completedTaskList[index],
              title: 'Completed',
              chipBorderColor: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getCompletedTaskList() async {
    _completedTaskList.clear();
    _completedTaskInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.completedTaskList);

    if (response.isSuccess) {
      final TaskListModel taskListModel = TaskListModel.fromJson(
        response.responseBody,
      );
      _completedTaskList = taskListModel.taskList ?? [];
    } else {
      snackBarMessage(context, response.errorMessage, true);
    }
    _completedTaskInProgress = false;
    setState(() {});
  }
}
