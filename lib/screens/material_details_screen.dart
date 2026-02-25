import 'package:flutter/material.dart';

class MaterialDetailsScreen extends StatelessWidget {
  const MaterialDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Catch the argument passed from the previous screen
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
            Text(
              materialName ?? 'Unknown Material',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text('Read this PDF to complete your assignment.'),
            const SizedBox(height: 40),
            // Explicit Pop Button (Though AppBar has a back arrow automatically)
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // This pops the screen off the stack!
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