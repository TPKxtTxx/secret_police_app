import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:secret_police_app/main.dart';

void main() {
  testWidgets('Incident list and navigation test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(SecretPoliceApp());

    // Verify that the incident list screen is displayed.
    expect(find.text('Incidencias'), findsOneWidget);

    // Tap the add incident button and navigate to the add incident screen.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify that the add incident screen is displayed.
    expect(find.text('Registrar Incidencia'), findsOneWidget);

    // Fill in the form fields.
    await tester.enterText(find.byType(TextFormField).at(0), 'Incidente de prueba');
    await tester.enterText(find.byType(TextFormField).at(1), 'Descripción de prueba');

    // Note: Add logic to test photo and audio pickers if possible.

    // Submit the form.
    await tester.tap(find.text('Guardar Incidencia'));
    await tester.pumpAndSettle();

    // Verify that the incident list screen is displayed again.
    expect(find.text('Incidencias'), findsOneWidget);

    // Note: Add logic to verify that the new incident is listed if possible.
  });
}
