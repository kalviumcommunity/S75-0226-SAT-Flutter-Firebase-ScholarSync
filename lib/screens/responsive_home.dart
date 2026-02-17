import 'package:flutter/material.dart';

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final bool isTablet = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive UI"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(isTablet ? 24 : 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Tablet or landscape layout
            if (constraints.maxWidth > 600 ||
                orientation == Orientation.landscape) {
              return GridView.count(
                crossAxisCount: isTablet ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  _FeatureCard(title: "Feature 1"),
                  _FeatureCard(title: "Feature 2"),
                  _FeatureCard(title: "Feature 3"),
                  _FeatureCard(title: "Feature 4"),
                ],
              );
            }

            // Phone portrait layout
            return Column(
              children: const [
                Expanded(child: _FeatureCard(title: "Feature 1")),
                SizedBox(height: 16),
                Expanded(child: _FeatureCard(title: "Feature 2")),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(isTablet ? 24 : 16),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Continue",
            style: TextStyle(fontSize: isTablet ? 18 : 14),
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;

  const _FeatureCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: FittedBox(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
