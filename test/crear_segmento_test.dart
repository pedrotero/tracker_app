import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tracker_app/pages/crear_segmento.dart';

void main() {
  testWidgets('CrearSegmentoWidget tiene dos campos de texto',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CrearSegmentoWidget()));

    expect(find.byType(TextFormField), findsNWidgets(2));
  });
}
