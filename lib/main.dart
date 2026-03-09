import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/material_details_screen.dart';
import 'screens/asset-demo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScholarSync',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F4C81),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),

      initialRoute: '/assets', // Change this to '/' to start with the DashboardScreen
      routes: {
        '/': (context) => const DashboardScreen(),
        '/material-details': (context) => const MaterialDetailsScreen(),
        '/assets': (context) => const AssetDemoScreen(),
      },
    );
  }
}
