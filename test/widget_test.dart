// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_cirrusci/src/app.dart';

void main() {

  final emailKeyString = 'emailInput';
  final passwordKeyString = 'passwordInput';

  final emailErrorText = 'Enter a valid email.';
  final passwordErrorText = 'Password must be at least 4 characters.';

  testWidgets('Login button available', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    expect(find.text('LOGIN'), findsOneWidget);
  });

  testWidgets('Text input fields available', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    expect(find.byType(TextField), findsNWidgets(2));
  });

  testWidgets('Test non valid input', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    final emailWidget = find.byKey(Key(emailKeyString));
    final passwordWidget = find.byKey(Key(passwordKeyString));

    expect(emailWidget, findsOneWidget);

    await tester.enterText(emailWidget, 'abc');
    await tester.pump();
    
    expect(find.text(emailErrorText), findsOneWidget);

    expect(passwordWidget, findsOneWidget);

    await tester.enterText(passwordWidget, '123');
    await tester.pump();

    expect(find.text(passwordErrorText), findsOneWidget);
  });

  testWidgets('Test valid input', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    final emailWidget = find.byKey(Key(emailKeyString));
    final passwordWidget = find.byKey(Key(passwordKeyString));

    expect(emailWidget, findsOneWidget);

    await tester.enterText(emailWidget, 'you@example.com');
    await tester.pump();

    expect(find.text(emailErrorText), findsNothing);

    expect(passwordWidget, findsOneWidget);

    await tester.enterText(emailWidget, '12345678');
    await tester.pump();

    expect(find.text(passwordErrorText), findsOneWidget);
  });
}
