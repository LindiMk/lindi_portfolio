import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        '© 2025 Lindi Mk | Built with Flutter 💙',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
