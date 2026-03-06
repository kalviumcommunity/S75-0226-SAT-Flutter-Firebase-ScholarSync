import 'package:flutter/material.dart';

class ResponsiveDashboardLayout extends StatelessWidget {
  const ResponsiveDashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Using MediaQuery for relative sizing of specific elements
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive ScholarSync'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 2. Using LayoutBuilder to completely change the layout structure
          if (constraints.maxWidth < 600) {
            // 📱 MOBILE LAYOUT: Vertical Stacking
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Uses MediaQuery to take 90% of screen width and 20% of height
                    _buildHeroCard(screenWidth * 0.9, screenHeight * 0.2), 
                    const SizedBox(height: 20),
                    _buildRecentActivityList(),
                  ],
                ),
              ),
            );
          } else {
            // 💊 TABLET LAYOUT: Side-by-Side Panels
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        // Adjusts relative height for the tablet view
                        _buildHeroCard(double.infinity, screenHeight * 0.25),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: _buildRecentActivityList(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Helper Widget: Hero Card
  Widget _buildHeroCard(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.indigo.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school, size: 50, color: Colors.indigo),
            SizedBox(height: 10),
            Text(
              'Welcome back, Teacher!', 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo)
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget: Activity List
  Widget _buildRecentActivityList() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recent Submissions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          const ListTile(leading: Icon(Icons.file_present), title: Text('Physics Assignment 3'), subtitle: Text('Submitted by Rahul')),
          const ListTile(leading: Icon(Icons.file_present), title: Text('Math Worksheet'), subtitle: Text('Submitted by Priya')),
          const ListTile(leading: Icon(Icons.file_present), title: Text('Chemistry Lab Report'), subtitle: Text('Submitted by Amit')),
        ],
      ),
    );
  }
}