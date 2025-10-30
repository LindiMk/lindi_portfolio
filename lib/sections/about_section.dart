import 'package:flutter/material.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Slide and fade for text content
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'About Me',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.tealAccent,
            ),
          ),
          const SizedBox(height: 24),
          AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              final screenWidth = MediaQuery.of(context).size.width;
              final double radius = (screenWidth * 0.2).clamp(
                40.0,
                100.0,
              ); // Responsive radius

              return Container(
                width: radius * 2,
                height: radius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.tealAccent.withOpacity(0.6),
                    width: 2 + 2 * _glowAnimation.value,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.tealAccent.withOpacity(
                        0.6 * _glowAnimation.value,
                      ),
                      blurRadius: 20 + 10 * _glowAnimation.value,
                      spreadRadius: 4 + 4 * _glowAnimation.value,
                    ),
                    BoxShadow(
                      color: Colors.purpleAccent.withOpacity(
                        0.3 * _glowAnimation.value,
                      ),
                      blurRadius: 30 + 10 * _glowAnimation.value,
                      spreadRadius: 8 + 4 * _glowAnimation.value,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/lindi.jpg',
                    fit: BoxFit.cover,
                    width: radius * 2,
                    height: radius * 2,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.tealAccent.withOpacity(0.2),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.tealAccent.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Text(
                  'Hi! I am Lindiwe Mkuzangwe, a passionate Flutter developer currently, expanding my expertise into Artificial Intelligence and IT Support, where I aim to leverage technology to create innovative solutions, enhance user experiences, and apply my problem-solving and system management skills effectively.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
