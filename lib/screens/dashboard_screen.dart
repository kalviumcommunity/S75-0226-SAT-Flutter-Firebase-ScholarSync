import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  // Keeping the user parameter optional for the demo
  final dynamic user; 
  const DashboardScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScholarSync Dashboard'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Recent Study Materials',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.book, color: Colors.indigo),
                title: const Text('Advanced Calculus Chapter 4'),
                subtitle: const Text('Uploaded today'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // This pushes the new route and passes the title as an argument!
                  Navigator.pushNamed(
                    context, 
                    '/material-details',
                    arguments: 'Advanced Calculus Chapter 4 (PDF)',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}