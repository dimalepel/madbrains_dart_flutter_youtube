import 'package:films_app/features/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';

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
            Navigator.pushNamed(
              context,
              '/settings',
              arguments: SettingsArguments('Bobik'),
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
