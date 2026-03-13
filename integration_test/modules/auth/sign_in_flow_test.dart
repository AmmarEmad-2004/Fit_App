import 'package:fit_app/core/utils/service_locator.dart';
import 'package:fit_app/modules/auth/data/repos/auth_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import 'sign_in_robot.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late SignInRobot robot;
  late MockAuthRepo mockAuthRepo;

  setUp(() async {
    await getIt.reset();
    setUPGetIt();
    getIt.allowReassignment = true;
    mockAuthRepo = MockAuthRepo();
    getIt.registerLazySingleton<AuthRepo>(() => mockAuthRepo);
  });

  group('SignIn Screen Validation', () {
    testWidgets(
      'Pressing Log In with all fields empty shows all required errors',
      (tester) async {
        robot = SignInRobot(tester);
        await robot.launchApp();

        await robot.tapLogIn();

        robot.expectError('Email is required');
        robot.expectError('Password is required');
      },
    );

    testWidgets(
      'Invalid email format shows email validation error',
      (tester) async {
        robot = SignInRobot(tester);
        await robot.launchApp();

        await robot.fillLoginForm(email: 'not-an-email');
        await robot.tapLogIn();

        robot.expectError('Enter a valid email address');
      },
    );

    testWidgets(
      'Password shorter than 6 characters shows length error',
      (tester) async {
        robot = SignInRobot(tester);
        await robot.launchApp();

        await robot.fillLoginForm(email: 'ammar@example.com', password: '123');
        await robot.tapLogIn();

        robot.expectError('Password must be at least 6 characters');
      },
    );

    testWidgets(
      'Valid email with empty password shows only password error',
      (tester) async {
        robot = SignInRobot(tester);
        await robot.launchApp();

        await robot.fillLoginForm(email: 'ammar@example.com');
        await robot.tapLogIn();

        robot.expectError('Password is required');
        robot.expectNoError('Email is required');
        robot.expectNoError('Enter a valid email address');
      },
    );

    testWidgets(
      'No validation errors shown before first submit attempt',
      (tester) async {
        robot = SignInRobot(tester);
        await robot.launchApp();

        await robot.fillLoginForm(email: 'bad', password: '12');

        robot.expectNoError('Enter a valid email address');
        robot.expectNoError('Password must be at least 6 characters');
      },
    );

    testWidgets(
      'After failed submit, correcting email clears its error live',
      (tester) async {
        robot = SignInRobot(tester);
        await robot.launchApp();

        await robot.tapLogIn();
        robot.expectError('Email is required');

        await robot.enterLoginEmail('fixed@example.com');

        robot.expectNoError('Email is required');
        robot.expectNoError('Enter a valid email address');
      },
    );
  });

  //  هنا هسال على حته ان هل ف تيست ل obsecure text field ولا لاء

  // ─── Firebase Flow ─────────────────────────────────────────────────────────

  group('SignIn Screen Firebase Flow', () {
    testWidgets(
      'Valid credentials show loading indicator while signing in',
      (tester) async {
        robot = SignInRobot(tester);
        await robot.launchApp();

        await robot.fillLoginForm(
          email: 'ammar@example.com',
          password: 'password123',
        );

        await robot.tapLogIn(waitToSettle: false);

        robot.expectLoadingIndicator();
      },
    );

    testWidgets(
      'Wrong password shows Firebase error snackbar',
      (tester) async {
        robot = SignInRobot(tester);
        await robot.launchApp();

        await robot.fillLoginForm(
          email: 'ammar@example.com',
          password: 'wrongPassword',
        );
        await robot.tapLogIn();

        robot.expectSnackBar();
      },
    );

    testWidgets(
      'Non-existent account shows Firebase error snackbar',
      (tester) async {
        robot = SignInRobot(tester);
        await robot.launchApp();

        await robot.fillLoginForm(
          email:
              'nonexistent_${DateTime.now().millisecondsSinceEpoch}@test.com',
          password: 'password123',
        );
        await robot.tapLogIn();

        robot.expectSnackBar();
      },
    );
  });
}
