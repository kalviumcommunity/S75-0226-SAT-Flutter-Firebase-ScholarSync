import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/dashboard_screen.dart';
import 'screens/login_screen.dart';
import 'screens/stateless_stateful_demo.dart'; 
import 'screens/user_input_form.dart';
import 'screens/material_details_screen.dart'; 
import 'screens/state_management_demo.dart';
import 'screens/responsive_dashboard_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScholarSync',
      debugShowCheckedModeBanner: false, // Hides the debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      
      // 2. USE initialRoute INSTEAD OF home
      initialRoute: '/responsive', 
      
      // 3. DEFINE YOUR NAMED ROUTES HERE
      routes: {
        // '/' is the default start page. We point it to your AuthGate to keep your login logic!
        '/': (context) => const AuthGate(), 
        // Route for your new details screen
        '/material-details': (context) => const MaterialDetailsScreen(),
        '/responsive': (context) => const ResponsiveDashboardLayout(),
        // I kept your previous demo screen here just in case you ever want to navigate to it!
        '/demo': (context) => const StatelessStatefulDemoScreen(), 
        '/add-student': (context) => const UserInputForm(), 
        '/attendance': (context) => const AttendanceTrackerScreen(),
      },
    );
  }
}

// Your AuthGate stays exactly as it was. It perfectly handles the login check!
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;
        if (user == null) {
          return const LoginScreen();
        }

        return DashboardScreen(user: user);
      },
    );
  }
}