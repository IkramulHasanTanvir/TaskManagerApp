import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/models/task_list_model.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utils/urls.dart';
import 'package:task_manager_app/ui/screens/add_new_screen.dart';
import 'package:task_manager_app/ui/widgets/snack_bar_message.dart';
import 'package:task_manager_app/ui/widgets/task_card.dart';
import 'package:task_manager_app/ui/widgets/task_summary_card.dart';
import '../../data/models/task_model.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  List<TaskModel> _newTaskList = [];
  bool inProgress = false;

  @override
  void initState() {
    _newTaskStatusList();
    super.initState();
  }

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
              child: Visibility(
                visible: !inProgress,
                replacement: const CircularProgressIndicator(),
                child: ListView.separated(
                  itemCount: _newTaskList.length,
                  itemBuilder: (context, index) => TaskCard(
                    taskModel: _newTaskList[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(),
                ),
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

  Future<void> _newTaskStatusList() async {
    _newTaskList.clear();
    inProgress = true;
    setState(() {});

    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.newTaskList,
    );
    if (response.isSuccess) {
      final TaskListModel taskListModel =
          TaskListModel.fromJson(response.responseBody);
      _newTaskList = taskListModel.taskList ?? [];
    } else {
      snackBarMessage(context, response.errorMessage, true);
    }
    inProgress = false;
    setState(() {});
  }
}
