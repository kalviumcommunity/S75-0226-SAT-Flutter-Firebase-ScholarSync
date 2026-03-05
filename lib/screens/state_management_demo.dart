import 'package:flutter/material.dart';

class AttendanceTrackerScreen extends StatefulWidget {
  const AttendanceTrackerScreen({super.key});

  @override
  State<AttendanceTrackerScreen> createState() => _AttendanceTrackerScreenState();
}

class _AttendanceTrackerScreenState extends State<AttendanceTrackerScreen> {
  // Local state variables
  int _presentStudents = 0;
  final int _totalStudents = 15; // Example batch size

  // Increment function using setState
  void _markPresent() {
    setState(() {
      if (_presentStudents < _totalStudents) {
        _presentStudents++;
      }
    });
  }

  // Decrement function using setState
  void _markAbsent() {
    setState(() {
      if (_presentStudents > 0) {
        _presentStudents--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Conditional logic based on state
    bool isFullAttendance = _presentStudents == _totalStudents;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Attendance'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Physics Batch A',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            
            // Conditional UI: Changes color when full attendance is reached
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: isFullAttendance ? Colors.green.shade100 : Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isFullAttendance ? Colors.green : Colors.indigo.shade200,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '$_presentStudents / $_totalStudents',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: isFullAttendance ? Colors.green.shade800 : Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isFullAttendance ? '100% Attendance! 🎉' : 'Students Present',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            // Interaction Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _markAbsent,
                  icon: const Icon(Icons.remove),
                  label: const Text('Absent'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade100,
                    foregroundColor: Colors.red.shade900,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _markPresent,
                  icon: const Icon(Icons.add),
                  label: const Text('Present'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade100,
                    foregroundColor: Colors.green.shade900,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}