import 'package:flutter/material.dart';

import '../../features/settings/pages/settings_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
        ),
        onPressed: () {},
      ),
      title: Text(
        title,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.sort,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SettingsPage();
                },
              ),
            );
          },
          icon: const Icon(
            Icons.settings,
          ),
        )
      ],
    );
  }
}
