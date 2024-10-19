import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/models/task_list_model.dart';
import 'package:task_manager_app/data/models/task_model.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utils/urls.dart';
import 'package:task_manager_app/ui/widgets/snack_bar_message.dart';
import 'package:task_manager_app/ui/widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  List<TaskModel> _progressTaskList = [];
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    _getProgressTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Visibility(
        visible: !inProgress,
        replacement: const Center(child: CircularProgressIndicator()),
        child: RefreshIndicator(
          onRefresh: () async {
            _getProgressTaskList();
          },
          child: ListView.builder(
            itemCount: _progressTaskList.length,
            itemBuilder: (context, index) => TaskCard(
              taskModel: _progressTaskList[index],
              title: 'Progress',
              chipBorderColor: Colors.amberAccent,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getProgressTaskList() async {
    _progressTaskList.clear();
    inProgress = true;
    setState(() {});
    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.progressTaskList,
    );

    if (response.isSuccess) {
      final TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseBody);
      _progressTaskList = taskListModel.taskList ?? [];
    } else {
      snackBarMessage(context, response.errorMessage, true);
    }
    inProgress = false;
    setState(() {});
  }
}
