import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Text(
              'Get In Touch',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'You can reach me via email or connect with me on GitHub and LinkedIn.',
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      launchUrl(Uri.parse('mailto:lindiemk34@gmail.com')),
                  child: const Text('Email Me'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      launchUrl(Uri.parse('https://github.com/LindiMk')),
                  child: const Text('GitHub'),
                ),
                ElevatedButton(
                  onPressed: () => launchUrl(
                    Uri.parse(
                      'https://www.linkedin.com/in/lindiwe-mkuzangwe-182a33318/',
                    ),
                  ),
                  child: const Text('LinkedIn'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
