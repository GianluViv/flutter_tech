import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tech/main.dart';

void main() {
  testWidgets('Pagina 1 mostra il pulsante per Pagina 2', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Pagina 1'), findsOneWidget);
    expect(find.text('Vai a Pagina 2'), findsOneWidget);
  });

  testWidgets('Navigazione da Pagina 1 a Pagina 2 e ritorno', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Vai a Pagina 2'));
    await tester.pumpAndSettle();

    expect(find.text('Pagina 2'), findsOneWidget);
    expect(find.text('Vai a Pagina 1'), findsOneWidget);

    await tester.tap(find.text('Vai a Pagina 1'));
    await tester.pumpAndSettle();

    expect(find.text('Pagina 1'), findsOneWidget);
  });
}
