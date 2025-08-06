import 'package:flutter/material.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  //final String? title;
  final bool showNotificationIcon;

  const AppBarr({
    super.key,
    this.showNotificationIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: showNotificationIcon
          ? [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () {},
        ),
      ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
