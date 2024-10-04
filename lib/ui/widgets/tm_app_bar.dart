import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/profile_screen.dart';
import 'package:task_manager_app/ui/screens/sing_in_screen.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
    this.isProfileScreenOpen = false,
  });

  final bool isProfileScreenOpen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isProfileScreenOpen) {
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
      },
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.themeColor,
        title: ListTile(
          textColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ),
          title: const Text('Rabbil Hasan'),
          subtitle: const Text('rabbilhasan@gamil.com'),
          trailing: IconButton(
            onPressed: () => _onTapLogout(context),
            icon: const Icon(Icons.logout),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _onTapLogout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SingInScreen(),
        ),
        (value) => false);
  }
}
