
# Testing Documentation

## 1. Testing Strategy
The app will be tested at three levels:

- **Unit Tests**: Test individual functions, methods, and classes.
- **Integration Tests**: Test interactions between components and features.
- **End-to-End (E2E) Tests**: Test complete user flows from start to finish.

---

## 2. Unit Tests
Unit tests focus on testing individual units of code in isolation.

### Testing Tools:
- **flutter_test**: Built-in testing framework for Flutter.
- **mockito**: For mocking dependencies (e.g., Firebase, repositories).

### Test Coverage:
- **Authentication**: Test AuthenticationBloc states and events. Mock `FirebaseAuthenticationRepository` to simulate login and signup scenarios.
- **Profile**: Test ProfileBloc states and events. Mock `FirestoreProfileRepository` to simulate profile updates.
- **History**: Test HistoryBloc states and events. Mock `FirestoreHistoryRepository` to simulate history retrieval and clearing.
- **Theme**: Test ThemeBloc states and events. Mock `LocalThemeRepository` to simulate theme updates.

### Example: Unit Test for Authentication

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_app/features/authentication/backend/data/repositories/authentication_repository.dart';
import 'package:your_app/features/authentication/backend/presentation/bloc/authentication_bloc.dart';
import 'package:your_app/features/authentication/backend/presentation/bloc/authentication_event.dart';
import 'package:your_app/features/authentication/backend/presentation/bloc/authentication_state.dart';

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

void main() {
  late AuthenticationBloc authenticationBloc;
  late MockAuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    authenticationBloc = AuthenticationBloc(mockAuthenticationRepository);
  });

  tearDown(() {
    authenticationBloc.close();
  });

  test('initial state is AuthenticationInitial', () {
    expect(authenticationBloc.state, equals(AuthenticationInitial()));
  });

  test('emits [AuthenticationLoading, AuthenticationSuccess] on successful login', () {
    when(mockAuthenticationRepository.login('test@example.com', 'password'))
        .thenAnswer((_) async => User(id: '1', name: 'Test User', email: 'test@example.com'));

    final expectedStates = [
      AuthenticationInitial(),
      AuthenticationLoading(),
      AuthenticationSuccess(User(id: '1', name: 'Test User', email: 'test@example.com')),
    ];

    expectLater(authenticationBloc.stream, emitsInOrder(expectedStates));

    authenticationBloc.add(LoginUser(email: 'test@example.com', password: 'password'));
  });
}
```

---

## 3. Integration Tests
Integration tests focus on testing interactions between components and features.

### Testing Tools:
- **flutter_test**: Built-in testing framework for Flutter.
- **mockito**: For mocking dependencies (e.g., Firebase, repositories).

### Test Coverage:
- **Authentication**: Test the interaction between the LoginScreen and AuthenticationBloc.
- **Profile**: Test the interaction between the ProfileScreen and ProfileBloc.
- **History**: Test the interaction between the HistoryScreen and HistoryBloc.
- **Theme**: Test the interaction between the ThemePicker and ThemeBloc.

### Example: Integration Test for Profile

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_app/features/profile/backend/data/repositories/profile_repository.dart';
import 'package:your_app/features/profile/backend/presentation/bloc/profile_bloc.dart';
import 'package:your_app/features/profile/backend/presentation/pages/profile_screen.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late ProfileBloc profileBloc;
  late MockProfileRepository mockProfileRepository;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    profileBloc = ProfileBloc(mockProfileRepository);
  });

  tearDown(() {
    profileBloc.close();
  });

  testWidgets('ProfileScreen displays user data', (WidgetTester tester) async {
    when(mockProfileRepository.getProfile('1'))
        .thenAnswer((_) async => Profile(userId: '1', name: 'Test User', email: 'test@example.com'));

    await tester.pumpWidget(MaterialApp(
      home: ProfileScreen(profileBloc: profileBloc),
    ));

    await tester.pump();

    expect(find.text('Test User'), findsOneWidget);
    expect(find.text('test@example.com'), findsOneWidget);
  });
}
```

---

## 4. End-to-End (E2E) Tests
E2E tests focus on testing complete user flows from start to finish.

### Testing Tools:
- **flutter_driver**: For writing and running E2E tests.

### Test Coverage:
- **Authentication Flow**: Test the complete flow from login to profile screen.
- **Profile Flow**: Test the complete flow from profile screen to editing profile.
- **History Flow**: Test the complete flow from history screen to clearing history.
- **Theme Flow**: Test the complete flow from theme picker to applying a new theme.

### Example: E2E Test for Authentication

```dart
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Authentication Flow', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('login and navigate to profile screen', () async {
      await driver.tap(find.byValueKey('emailField'));
      await driver.enterText('test@example.com');

      await driver.tap(find.byValueKey('passwordField'));
      await driver.enterText('password');

      await driver.tap(find.byValueKey('loginButton'));

      await driver.waitFor(find.text('Test User'));
      await driver.waitFor(find.text('test@example.com'));
    });
  });
}
```

---

## 5. Folder Structure for Testing
```
test/
├── unit/
│   ├── authentication/
│   │   ├── authentication_bloc_test.dart
│   ├── profile/
│   │   ├── profile_bloc_test.dart
│   ├── history/
│   │   ├── history_bloc_test.dart
│   ├── theme/
│   │   ├── theme_bloc_test.dart
├── integration/
│   ├── authentication/
│   │   ├── login_screen_test.dart
│   ├── profile/
│   │   ├── profile_screen_test.dart
│   ├── history/
│   │   ├── history_screen_test.dart
│   ├── theme/
│   │   ├── theme_picker_test.dart
├── e2e/
│   ├── authentication_flow_test.dart
│   ├── profile_flow_test.dart
│   ├── history_flow_test.dart
│   ├── theme_flow_test.dart
```

---

## 6. Testing Best Practices

- **Write Tests Early**: Write tests alongside feature development to catch issues early.
- **Mock Dependencies**: Use `mockito` to mock external dependencies (e.g., Firebase, repositories).
- **Test Edge Cases**: Test edge cases (e.g., invalid inputs, network errors) to ensure robustness.
- **Automate Testing**: Use CI/CD pipelines (e.g., GitHub Actions) to automate testing and deployment.
- **Monitor Test Coverage**: Aim for high test coverage (e.g., 80%+) to ensure comprehensive testing.
