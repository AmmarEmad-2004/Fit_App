import 'package:fit_app/core/utils/service_locator.dart';
import 'package:fit_app/modules/auth/data/repos/auth_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fit_app/core/errors/auth_failuer.dart';
import 'package:fit_app/modules/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import 'sign_up_robot.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late SignUpRobot robot;
  late MockAuthRepo mockAuthRepo;

  setUp(() async {
    await getIt.reset();
    setUPGetIt();
    getIt.allowReassignment = true;
    mockAuthRepo = MockAuthRepo();
    getIt.registerLazySingleton<AuthRepo>(() => mockAuthRepo);

    when(() => mockAuthRepo.signUp(
          name: any(named: 'name'),
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((invocation) async {
      final email = invocation.namedArguments[#email] as String;

      if (email == 'existing@test.com') {
        return Left(AuthFailure(errorMessage: 'Email already exists.'));
      }
      return Right(UserModel(name: 'Test', email: email, uid: '123'));
    });
  });

  // ─── Validation ────────────────────────────────────────────────────────────

  group('Sign-Up Screen Validation', () {
    testWidgets(
      'Pressing Sign Up with all fields empty shows all required errors',
      (tester) async {
        robot = SignUpRobot(tester);
        await robot.launchApp();

        await robot.tapSignUp();

        robot.expectError('Name is required');
        robot.expectError('Email is required');
        robot.expectError('Password is required');
        robot.expectError('Please confirm your password');
      },
    );

    testWidgets(
      'Name shorter than 3 characters shows name length error',
      (tester) async {
        robot = SignUpRobot(tester);
        await robot.launchApp();

        await robot.fillSignUpForm(name: 'Al');
        await robot.tapSignUp();

        robot.expectError('Name must be at least 3 characters');
      },
    );

    testWidgets(
      'Invalid email format shows email validation error',
      (tester) async {
        robot = SignUpRobot(tester);
        await robot.launchApp();

        await robot.fillSignUpForm(name: 'John Doe', email: 'not-an-email');
        await robot.tapSignUp();

        robot.expectError('Enter a valid email address');
      },
    );

    testWidgets(
      'Password shorter than 6 characters shows password length error',
      (tester) async {
        robot = SignUpRobot(tester);
        await robot.launchApp();

        await robot.fillSignUpForm(
          name: 'John Doe',
          email: 'john@example.com',
          password: '123',
        );
        await robot.tapSignUp();

        robot.expectError('Password must be at least 6 characters');
      },
    );

    testWidgets(
      'Mismatched confirm password shows mismatch error',
      (tester) async {
        robot = SignUpRobot(tester);
        await robot.launchApp();

        await robot.fillSignUpForm(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
          confirmPassword: 'different123',
        );
        await robot.tapSignUp();

        robot.expectError('Passwords do not match');
      },
    );

    testWidgets(
      'Empty confirm password field shows confirm required error',
      (tester) async {
        robot = SignUpRobot(tester);
        await robot.launchApp();

        await robot.fillSignUpForm(
          name: 'John Doe',
          email: 'john@example.com',
          password: 'password123',
        );
        await robot.tapSignUp();

        robot.expectError('Please confirm your password');
      },
    );

    testWidgets(
      'No validation errors shown before first submit attempt',
      (tester) async {
        robot = SignUpRobot(tester);
        await robot.launchApp();

        // Type invalid data WITHOUT pressing submit
        await robot.fillSignUpForm(email: 'bad-email');

        robot.expectNoError('Enter a valid email address');
        robot.expectNoError('Email is required');
      },
    );

    testWidgets(
      'After failed submit, fixing a field clears its error live',
      (tester) async {
        robot = SignUpRobot(tester);
        await robot.launchApp();

        await robot.tapSignUp();
        robot.expectError('Email is required');

        // Fix the email — error should clear immediately
        await robot.enterSignUpEmail('valid@example.com');

        robot.expectNoError('Email is required');
        robot.expectNoError('Enter a valid email address');
      },
    );
  });

  // ─── Firebase Flow ─────────────────────────────────────────────────────────

  group('Sign-Up Screen  Firebase Flow', () {
    testWidgets(
      'Valid data shows loading indicator while signing up',
      (tester) async {
        robot = SignUpRobot(tester);
        await robot.launchApp();

        await robot.fillSignUpForm(
          name: 'Test User',
          email: 'testuser_${DateTime.now().millisecondsSinceEpoch}@test.com',
          password: 'password123',
          confirmPassword: 'password123',
        );

        await robot.tapSignUp(waitToSettle: false);

        robot.expectLoadingIndicator();
      },
    );

    testWidgets(
      'Signing up with an already-registered email shows error snackbar',
      (tester) async {
        robot = SignUpRobot(tester);
        await robot.launchApp();

        await robot.fillSignUpForm(
          name: 'Existing User',
          email: 'existing@test.com',
          password: 'password123',
          confirmPassword: 'password123',
        );
        await robot.tapSignUp();
        robot.expectSnackBar();
      },
    );
  });
}
