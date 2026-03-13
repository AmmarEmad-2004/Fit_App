import 'package:fit_app/modules/auth/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:go_router/go_router.dart';

class MockGoRouter extends Mock implements GoRouter {}

class SignInRobot {
  SignInRobot(this.tester);

  final WidgetTester tester;

  Future<void> launchApp() async {
    final mockRouter = MockGoRouter();
    when(() => mockRouter.push(any())).thenAnswer((_) async => null);

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InheritedGoRouter(
          goRouter: mockRouter,
          child: const LoginScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> enterLoginEmail(String email) async {
    final finder = find.byKey(const Key('login_email'));

    await tester.enterText(finder, email);
    await tester.pumpAndSettle();
  }

  Future<void> enterLoginPassword(String password) async {
    final finder = find.byKey(const Key('login_password'));

    await tester.enterText(finder, password);
    await tester.pumpAndSettle();
  }

  Future<void> fillLoginForm({
    String email = '',
    String password = '',
  }) async {
    if (email.isNotEmpty) await enterLoginEmail(email);
    if (password.isNotEmpty) await enterLoginPassword(password);
  }

  Future<void> tapLogIn({bool waitToSettle = true}) async {
    final finder = find.byKey(const Key('login_button'));
    await tester.tap(finder);

    if (waitToSettle) {
      await tester.pumpAndSettle();
    } else {
      await tester.pump();
    }
  }

  Future<void> tapLoginPasswordVisibilityToggle() async {
    final finder = find.descendant(
      of: find.byKey(const Key('login_password')),
      matching: find.byType(IconButton),
    );
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

//__________________________________________________
  void expectError(String message) =>
      expect(find.text(message), findsOneWidget);

  void expectNoError(String message) =>
      expect(find.text(message), findsNothing);

  void expectLoadingIndicator() =>
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

  void expectSnackBar() => expect(find.byType(SnackBar), findsOneWidget);

  void expectWidget(Finder finder) => expect(finder, findsOneWidget);
}
