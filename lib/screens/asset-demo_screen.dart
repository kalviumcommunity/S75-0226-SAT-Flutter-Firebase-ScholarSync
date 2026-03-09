import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Required for CupertinoIcons

class AssetDemoScreen extends StatelessWidget {
  const AssetDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Profile'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Background Image using Container & DecorationImage
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  // Make sure you have a banner.png in your assets/images/ folder!
                  image: AssetImage('assets/images/banner.png'), 
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.4), // Dark overlay for text readability
                child: const Center(
                  child: Text(
                    'ScholarSync Faculty',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 2. Standard Local Image
            // Make sure you have a logo.png in your assets/images/ folder!
            Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
              // Adding an error builder just in case the image name is wrong
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Text('Mr. Thamizhanban M.', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Senior Physics Coach', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 30),

            // 3. Mixing Material and Cupertino Icons
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Divider(),
            ),
            const SizedBox(height: 10),
            const Text('Badges & Achievements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Material Icons
                const Column(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 40),
                    Text('Top Rated'),
                  ],
                ),
                const SizedBox(width: 30),
                const Column(
                  children: [
                    Icon(Icons.verified, color: Colors.blue, size: 40),
                    Text('Verified'),
                  ],
                ),
                const SizedBox(width: 30),
                // Cupertino Icon (iOS style)
                Column(
                  children: [
                    Icon(CupertinoIcons.heart_fill, color: Colors.red.shade400, size: 40),
                    const Text('Student Fav'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}