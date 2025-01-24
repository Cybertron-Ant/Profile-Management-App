import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:towers/components/my_app.dart';
import 'package:towers/core/service_locator.dart';

void main() {
  setUp(() {
    setupServiceLocator();
  });

  testWidgets('App should build without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
