import 'package:fit_app/modules/auth/ui/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:go_router/go_router.dart';

class MockGoRouter extends Mock implements GoRouter {}

class SignUpRobot {
  SignUpRobot(this.tester);

  final WidgetTester tester;

  Future<void> launchApp() async {
    final mockRouter = MockGoRouter();
    when(() => mockRouter.push(any())).thenAnswer((_) async => null);
    
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InheritedGoRouter(
          goRouter: mockRouter,
          child: const SignUpScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> enterName(String name) async {
    final finder = find.byKey(const Key('sign_up_name'));
    await tester.ensureVisible(finder);
    await tester.enterText(finder, name);
    await tester.pumpAndSettle();
  }

  Future<void> enterSignUpEmail(String email) async {
    final finder = find.byKey(const Key('sign_up_email'));
    await tester.ensureVisible(finder);
    await tester.enterText(finder, email);
    await tester.pumpAndSettle();
  }

  Future<void> enterSignUpPassword(String password) async {
    final finder = find.byKey(const Key('sign_up_password'));
    await tester.ensureVisible(finder);
    await tester.enterText(finder, password);
    await tester.pumpAndSettle();
  }

  Future<void> enterConfirmPassword(String password) async {
    final finder = find.byKey(const Key('sign_up_confirm_password'));
    await tester.ensureVisible(finder);
    await tester.enterText(finder, password);
    await tester.pumpAndSettle();
  }

  Future<void> fillSignUpForm({
    String name = '',
    String email = '',
    String password = '',
    String confirmPassword = '',
  }) async {
    if (name.isNotEmpty) await enterName(name);
    if (email.isNotEmpty) await enterSignUpEmail(email);
    if (password.isNotEmpty) await enterSignUpPassword(password);
    if (confirmPassword.isNotEmpty) await enterConfirmPassword(confirmPassword);
  }

  Future<void> tapSignUp({bool waitToSettle = true}) async {
    final finder = find.byKey(const Key('sign_up_button'));
    await tester.ensureVisible(finder);
    await tester.tap(finder);

    if (waitToSettle) {
      await tester.pumpAndSettle();
    } else {
      await tester.pump(); // one frame only — to catch the loading state
    }
  }

  Future<void> tapPasswordVisibilityToggle() async {
    final finder = find.descendant(
      of: find.byKey(const Key('sign_up_password')),
      matching: find.byType(IconButton),
    );
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> tapConfirmPasswordVisibilityToggle() async {
    final finder = find.descendant(
      of: find.byKey(const Key('sign_up_confirm_password')),
      matching: find.byType(IconButton),
    );
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void expectError(String message) =>
      expect(find.text(message), findsOneWidget);

  void expectNoError(String message) =>
      expect(find.text(message), findsNothing);

  void expectLoadingIndicator() =>
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

  void expectSnackBar() => expect(find.byType(SnackBar), findsOneWidget);

  void expectWidget(Finder finder) => expect(finder, findsOneWidget);

  bool get isAnyFieldObscured => tester
      .widgetList<EditableText>(find.byType(EditableText))
      .any((e) => e.obscureText);

  int get obscuredFieldCount => tester
      .widgetList<EditableText>(find.byType(EditableText))
      .where((e) => e.obscureText)
      .length;

  Future<void> waitForFirebase(
          [Duration duration = const Duration(seconds: 5)]) =>
      tester.pumpAndSettle(duration);
}
