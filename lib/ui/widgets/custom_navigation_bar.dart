import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.onTapNavigate,
    required this.selectedIndex,
  });

  final ValueChanged<int> onTapNavigate;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onTapNavigate,
      selectedIndex: selectedIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.add_task),
          selectedIcon: Icon(Icons.add_task_outlined),
          label: 'New',
        ),
        NavigationDestination(
          icon: Icon(Icons.check_circle_outline),
          selectedIcon: Icon(Icons.check_circle),
          label: 'Completed',
        ),
        NavigationDestination(
          icon: Icon(Icons.cancel_outlined),
          selectedIcon: Icon(Icons.cancel),
          label: 'Canceled',
        ),
        NavigationDestination(
          icon: Icon(Icons.access_time_rounded),
          selectedIcon: Icon(Icons.access_time_filled),
          label: 'Progress',
        ),
      ],
    );
  }
}
