import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/sing_in_screen.dart';
import 'package:task_manager_app/ui/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.themeColor,
      title: ListTile(
        textColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: const Text('Rabbil Hasan'),
        subtitle: const Text('rabbilhasan@gmail.com'),
        trailing: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => _onTapLogout(context),
        ),
      ),
    );
  }

  void _onTapLogout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SingInScreen(),
        ),
        (predicate) => false);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
