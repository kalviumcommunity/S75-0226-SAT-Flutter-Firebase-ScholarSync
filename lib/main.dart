import 'screens/responsive_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScholarSync',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ResponsiveHome(),

    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isWelcomed = false;

  void _toggleWelcome() {
    setState(() {
      _isWelcomed = !_isWelcomed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color accentColor = _isWelcomed ? Colors.teal : Colors.indigo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ScholarSync',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Icon(
              Icons.school_rounded,
              size: 96,
              color: accentColor,
            ),
            const SizedBox(height: 16),
            Text(
              _isWelcomed
                  ? 'Glad to have you here!'
                  : 'Tap the button to get started.',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _toggleWelcome,
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: Text(_isWelcomed ? 'Reset' : 'Welcome Me'),
            ),
          ],
        ),
      ),
    );
  }
}
