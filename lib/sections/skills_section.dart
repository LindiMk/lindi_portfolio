import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter',
      'Dart',
      'C#',
      'Microsoft',
      'Phython',
      'JavaScript',
      'GitHub',
      'HTML',
      'CSS',
      'IT Support',
      'Networking',
    ];

    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Text(
              'Skills & Tools',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: skills
                  .map((skill) => Chip(label: Text(skill)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
