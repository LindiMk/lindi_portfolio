import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'AI Study Buddy',
        'description':
            'MediMind is an AI-powered educational app that helps students learn through interactive conversations and quizzes. It uses Google\'s Gemini AI API to generate intelligent responses and subject-specific quiz content.',
        'link': 'https://github.com/LindiMk/MediMindv2',
      },
      {
        'title': 'Personal Portfolio (This Project)',
        'description':
            'A Flutter web app showcasing my skills, projects, and contact information.',
        'link': 'https://github.com/yourusername/lindi_portfolio',
      },
    ];

    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Projects',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Column(
              children: projects.map((project) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(project['title']!),
                    subtitle: Text(project['description']!),
                    trailing: TextButton(
                      onPressed: () async {
                        final url = project['link']!;
                        final uri = Uri.tryParse(url);

                        if (uri != null) {
                          bool launched = await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                          if (!launched) {
                            // Try in-app view as fallback
                            launched = await launchUrl(
                              uri,
                              mode: LaunchMode.inAppWebView,
                            );
                          }

                          if (!launched) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: Text(
                                  'Could not launch the project link:\n$url',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('View on GitHub'),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
