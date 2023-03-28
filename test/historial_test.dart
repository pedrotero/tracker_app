import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tracker_app/pages/historial.dart';

void main() {
  testWidgets('HistorialWidget displays title', (WidgetTester tester) async {
    // Build the widget tree.
    await tester.pumpWidget(MaterialApp(home: HistorialWidget()));

    // Find the text widget containing the title.
    final titleFinder = find.text('Historial de actividades');

    // Expect the title to be found.
    expect(titleFinder, findsOneWidget);
  });
}
