// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ecommerce_app/scaffold/general_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('GeneralScaffold renders title, actions and body', (WidgetTester tester) async {
    // Build the scaffold and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: GeneralScaffold(
          title: "Home",
          body: Text("Hello"),
        ),
      ),
    );

    // Verify the title, common cart action, profile and body render.
    expect(find.text('Home'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.text('Hello'), findsOneWidget);
  });
}
