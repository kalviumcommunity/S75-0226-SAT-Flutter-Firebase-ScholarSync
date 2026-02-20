import 'package:flutter/material.dart';

// --- MAIN SCREEN ---
class StatelessStatefulDemoScreen extends StatelessWidget {
  const StatelessStatefulDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Demo'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Using the Stateless Widget
            StaticHeaderWidget(
              title: 'ScholarSync Study Tracker',
              subtitle: 'Track your completed assignments today.',
            ),
            SizedBox(height: 40),
            // 2. Using the Stateful Widget
            InteractiveTaskCounter(),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 1. STATELESS WIDGET (Static UI)
// ==========================================
class StaticHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const StaticHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  // This build method only runs ONCE. The text never changes.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. STATEFUL WIDGET (Dynamic UI)
// ==========================================
class InteractiveTaskCounter extends StatefulWidget {
  const InteractiveTaskCounter({super.key});

  @override
  State<InteractiveTaskCounter> createState() => _InteractiveTaskCounterState();
}

class _InteractiveTaskCounterState extends State<InteractiveTaskCounter> {
  // Mutable State Variables
  int _completedTasks = 0;
  bool _isFocusMode = false;

  // Function to update state
  void _incrementTasks() {
    setState(() {
      _completedTasks++;
    });
  }

  void _toggleFocusMode(bool value) {
    setState(() {
      _isFocusMode = value;
    });
  }

  // This build method runs EVERY TIME setState() is called.
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: _isFocusMode ? Colors.grey.shade900 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          // Focus Mode Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Focus Mode',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _isFocusMode ? Colors.white : Colors.black,
                ),
              ),
              Switch(
                value: _isFocusMode,
                onChanged: _toggleFocusMode,
                activeColor: Colors.blueAccent,
              ),
            ],
          ),
          const SizedBox(height: 30),
          
          // Dynamic Counter
          Text(
            '$_completedTasks',
            style: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: _isFocusMode ? Colors.blueAccent : Colors.black87,
            ),
          ),
          Text(
            'Tasks Completed',
            style: TextStyle(
              fontSize: 16,
              color: _isFocusMode ? Colors.white70 : Colors.black54,
            ),
          ),
          const SizedBox(height: 30),
          
          // Action Button
          ElevatedButton.icon(
            onPressed: _incrementTasks,
            icon: const Icon(Icons.check_circle),
            label: const Text('Mark Task as Done'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}