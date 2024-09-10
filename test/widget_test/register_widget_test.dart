import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hiberus/form/presentation/views/form.dart';

void main() {
  testWidgets('register', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FormView(),
      ),
    );
    final emailTextField = find.byKey(const ValueKey('email'));
    final nameTextField = find.byKey(const ValueKey('name'));
    final surNameTextField = find.byKey(const ValueKey('surname'));

    expect(emailTextField, findsOneWidget);
    expect(nameTextField, findsOneWidget);
    expect(surNameTextField, findsOneWidget);

    await tester.enterText(emailTextField, 'riki@mail.com');
    await tester.enterText(nameTextField, 'Hector');
  });
}
