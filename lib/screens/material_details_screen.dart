import 'package:flutter/material.dart';

class MaterialDetailsScreen extends StatelessWidget {
  const MaterialDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This line catches the argument (the material name) passed from the Dashboard!
    final materialName = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Details'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.picture_as_pdf, size: 80, color: Colors.redAccent),
            const SizedBox(height: 20),
            // Display the dynamic name passed via routing
            Text(
              materialName ?? 'Unknown Material',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text('Read this document to complete your assignment.'),
            const SizedBox(height: 40),
            
            // The magic POP button!
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // Returns the user to the previous screen
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}