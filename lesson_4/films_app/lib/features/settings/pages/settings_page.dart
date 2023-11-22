import 'package:flutter/material.dart';

class SettingsArguments {
  final String name;

  SettingsArguments(
    this.name,
  );
}

class SettingsPage extends StatelessWidget {
  final SettingsArguments arguments;
  static const path = '/settings';

  const SettingsPage({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Text('User: ${arguments.name}'),
      ),
    );
  }
}
