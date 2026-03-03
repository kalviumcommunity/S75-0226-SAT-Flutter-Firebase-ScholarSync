import 'package:flutter/material.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  const ResponsiveLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Get the screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTabletOrLandscape = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics Dashboard'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TOP HEADER (Always full width)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  Text('Physics Batch - Class 12', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo)),
                  Text('Overall Attendance: 92%', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // RESPONSIVE SECTION
            Expanded(
              child: isTabletOrLandscape
                  ? Row( // IF TABLET/LANDSCAPE: Put them side-by-side
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildStatsContainer()),
                        const SizedBox(width: 20),
                        Expanded(flex: 2, child: _buildActivityContainer()),
                      ],
                    )
                  : Column( // IF PHONE (Portrait): Stack them vertically
                      children: [
                        _buildStatsContainer(),
                        const SizedBox(height: 20),
                        Expanded(child: _buildActivityContainer()),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for the Stats Box
  Widget _buildStatsContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.bar_chart, size: 50, color: Colors.orange),
          SizedBox(height: 10),
          Text('Pending Assignments', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('14 Students', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }

  // Helper method for the Activity Box
  Widget _buildActivityContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.greenAccent.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('Rahul submitted Calculus')),
          ListTile(leading: Icon(Icons.check_circle, color: Colors.green), title: Text('Priya submitted Physics')),
        ],
      ),
    );
  }
}