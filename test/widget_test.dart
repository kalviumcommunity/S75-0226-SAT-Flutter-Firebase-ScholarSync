import 'package:flutter_test/flutter_test.dart';

import 'package:scholarsync/main.dart';

void main() {
  testWidgets('ScholarSync workflow smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('ScholarSync'), findsOneWidget);
    expect(find.text('Teacher Dashboard'), findsOneWidget);
    expect(find.text('Upload Material'), findsOneWidget);

    await tester.tap(find.text('Student'));
    await tester.pumpAndSettle();

    expect(find.text('Student Workspace'), findsOneWidget);
    expect(find.text('Pending Tasks & Completion'), findsOneWidget);
  });
}
