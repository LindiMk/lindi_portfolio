import 'package:flutter/material.dart';
import 'package:lindi_portfolio/widgets/floating_emojis.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer.dart';
import 'theme/app_theme.dart';
import 'dart:math';

void main() {
  runApp(const LindiPortfolioApp());
}

class LindiPortfolioApp extends StatelessWidget {
  const LindiPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lindi Mk Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  bool isDarkMode = true; // <-- start in dark mode

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lindi Mk Portfolio'),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: toggleTheme,
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(child: FloatingEmojis()), // floating emojis
            SingleChildScrollView(
              child: Column(
                children: const [
                  AboutSection(),
                  SkillsSection(),
                  ProjectsSection(),
                  ContactSection(),
                  Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingEmojis extends StatefulWidget {
  const FloatingEmojis({super.key});

  @override
  _FloatingEmojisState createState() => _FloatingEmojisState();
}

class _FloatingEmojisState extends State<FloatingEmojis>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Emoji> _emojis = [];
  final random = Random();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // Generate random emojis at different positions
    final emojiList = ['💻', '✨', '🚀', '🎨', '🧠', '🔥', '🌈', '💡'];
    for (var i = 0; i < 15; i++) {
      _emojis.add(
        _Emoji(
          emoji: emojiList[random.nextInt(emojiList.length)],
          dx: random.nextDouble(),
          dy: random.nextDouble(),
          speed: 0.1 + random.nextDouble() * 0.5,
          size: 24 + random.nextDouble() * 16,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Stack(
          children: _emojis.map((emoji) {
            final dy = (emoji.dy + _controller.value * emoji.speed) % 1;
            return Positioned(
              top: dy * MediaQuery.of(context).size.height,
              left: emoji.dx * MediaQuery.of(context).size.width,
              child: Opacity(
                opacity: 0.5,
                child: Text(
                  emoji.emoji,
                  style: TextStyle(fontSize: emoji.size),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _Emoji {
  final String emoji;
  final double dx;
  final double dy;
  final double speed;
  final double size;

  _Emoji({
    required this.emoji,
    required this.dx,
    required this.dy,
    required this.speed,
    required this.size,
  });
}
