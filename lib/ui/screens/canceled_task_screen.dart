import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/models/task_list_model.dart';
import 'package:task_manager_app/data/models/task_model.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utils/urls.dart';
import 'package:task_manager_app/ui/widgets/snack_bar_message.dart';
import 'package:task_manager_app/ui/widgets/task_card.dart';

class CanceledTaskScreen extends StatefulWidget {
  const CanceledTaskScreen({super.key});

  @override
  State<CanceledTaskScreen> createState() => _CanceledTaskScreenState();
}

class _CanceledTaskScreenState extends State<CanceledTaskScreen> {
  List<TaskModel> _canceledTaskList = [];
  bool _canceledTaskListInProgress = false;

  @override
  void initState() {
    _getCancelTaskList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Visibility(
        visible: !_canceledTaskListInProgress,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            _getCancelTaskList();
          },
          child: ListView.builder(
            itemCount: _canceledTaskList.length,
            itemBuilder: (context, index) => TaskCard(
              taskModel: _canceledTaskList[index],
              title: 'Canceled',
              chipBorderColor: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getCancelTaskList() async {
    _canceledTaskList.clear();
    _canceledTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.canceledTaskList,
    );
    if (response.isSuccess) {
      final TaskListModel taskListModel = TaskListModel.fromJson(
        response.responseBody,
      );
      _canceledTaskList = taskListModel.taskList ?? [];
    } else {
      snackBarMessage(context, response.errorMessage, true);
    }
    _canceledTaskListInProgress = false;
    setState(() {});
  }
}
