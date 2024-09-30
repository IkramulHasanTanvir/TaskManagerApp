import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/canceled_task_screen.dart';
import 'package:task_manager_app/ui/screens/completed_task_screen.dart';
import 'package:task_manager_app/ui/screens/new_task_screen.dart';
import 'package:task_manager_app/ui/screens/progress_task_screen.dart';
import 'package:task_manager_app/ui/widgets/custom_app_bar.dart';
import 'package:task_manager_app/ui/widgets/custom_navigation_bar.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CanceledTaskScreen(),
    ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onTapNavigate: _onTapNavigate,
      ),
    );
  }

  void _onTapNavigate(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
