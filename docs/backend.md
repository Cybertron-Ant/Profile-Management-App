
# Backend Documentation

## 1. Firebase Integration
Firebase will serve as the backend for authentication, data storage, and real-time updates.

### Packages:
- **firebase_core**: Initialize Firebase.
- **firebase_auth**: Handle user authentication.
- **cloud_firestore**: Store and retrieve user data (e.g., profile, history).
- **firebase_storage**: Store profile pictures.

### Initialization:
1. Add Firebase configuration files (`google-services.json` for Android, `GoogleService-Info.plist` for iOS).
2. Initialize Firebase in `main.dart`:
   ```dart
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp();
     runApp(MyApp());
   }
   ```

---

## 2. Authentication
### Firebase Authentication:
Use **firebase_auth** for email/password and social login.

### User Entity:
```dart
class User {
  final String id;
  final String name;
  final String email;
  final String? profilePictureUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profilePictureUrl,
  });
}
```

### Use Cases:
- **LoginUser**:
  - **Input**: Email, password.
  - **Output**: User entity.
- **SignUpUser**:
  - **Input**: Name, email, password.
  - **Output**: User entity.

### Repository:
**AuthenticationRepository Interface**:
```dart
abstract class AuthenticationRepository {
  Future<User> login(String email, String password);
  Future<User> signUp(String name, String email, String password);
  Future<void> logout();
}
```

### Implementation:
**FirebaseAuthenticationRepository**:
```dart
class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User> login(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _mapUserCredentialToUser(userCredential);
  }

  @override
  Future<User> signUp(String name, String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _mapUserCredentialToUser(userCredential);
  }

  User _mapUserCredentialToUser(UserCredential userCredential) {
    final user = userCredential.user!;
    return User(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
}
```

---

## 3. Profile Management
### Firestore Database:
- **Collection**: `users`
- **Document**: `userId`
- **Fields**: `name`, `email`, `bio`, `profilePictureUrl`, `theme`.

### Profile Entity:
```dart
class Profile {
  final String userId;
  final String name;
  final String email;
  final String? bio;
  final String? profilePictureUrl;
  final String theme;

  Profile({
    required this.userId,
    required this.name,
    required this.email,
    this.bio,
    this.profilePictureUrl,
    this.theme = 'default',
  });
}
```

### Use Cases:
- **GetProfile**:
  - **Input**: `userId`.
  - **Output**: Profile entity.
- **UpdateProfile**:
  - **Input**: Profile entity.
  - **Output**: void.

### Repository:
**ProfileRepository Interface**:
```dart
abstract class ProfileRepository {
  Future<Profile> getProfile(String userId);
  Future<void> updateProfile(Profile profile);
}
```

### Implementation:
**FirestoreProfileRepository**:
```dart
class FirestoreProfileRepository implements ProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Profile> getProfile(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    return Profile.fromMap(doc.data()!);
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    await _firestore.collection('users').doc(profile.userId).update(profile.toMap());
  }
}
```

---

## 4. History Management
### Firestore Database:
- **Collection**: `history`
- **Document**: `userId`
- **Subcollection**: `items`
- **Fields**: `activity`, `timestamp`.

### History Entity:
```dart
class HistoryItem {
  final String activity;
  final DateTime timestamp;

  HistoryItem({required this.activity, required this.timestamp});
}
```

### Use Cases:
- **GetHistory**:
  - **Input**: `userId`.
  - **Output**: List of `HistoryItem`.
- **ClearHistory**:
  - **Input**: `userId`.
  - **Output**: void.

### Repository:
**HistoryRepository Interface**:
```dart
abstract class HistoryRepository {
  Future<List<HistoryItem>> getHistory(String userId);
  Future<void> clearHistory(String userId);
}
```

### Implementation:
**FirestoreHistoryRepository**:
```dart
class FirestoreHistoryRepository implements HistoryRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<HistoryItem>> getHistory(String userId) async {
    final snapshot = await _firestore
        .collection('history')
        .doc(userId)
        .collection('items')
        .get();
    return snapshot.docs.map((doc) => HistoryItem.fromMap(doc.data())).toList();
  }

  @override
  Future<void> clearHistory(String userId) async {
    await _firestore
        .collection('history')
        .doc(userId)
        .collection('items')
        .get()
        .then((snapshot) {
      for (final doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }
}
```

---

## 5. Theme Management
### Local Storage:
Use **shared_preferences** or **hive** to store theme preferences.

### Theme Entity:
```dart
class Theme {
  final String name;
  final String primaryColor;
  final String secondaryColor;

  Theme({
    required this.name,
    required this.primaryColor,
    required this.secondaryColor,
  });
}
```

### Use Cases:
- **GetTheme**:
  - **Input**: `userId`.
  - **Output**: Theme entity.
- **UpdateTheme**:
  - **Input**: Theme entity.
  - **Output**: void.

### Repository:
**ThemeRepository Interface**:
```dart
abstract class ThemeRepository {
  Future<Theme> getTheme(String userId);
  Future<void> updateTheme(Theme theme);
}
```

### Implementation:
**LocalThemeRepository**:
```dart
class LocalThemeRepository implements ThemeRepository {
  final SharedPreferences _prefs;

  LocalThemeRepository(this._prefs);

  @override
  Future<Theme> getTheme(String userId) async {
    final themeName = _prefs.getString('theme') ?? 'default';
    return Theme(name: themeName, primaryColor: '#FFFFFF', secondaryColor: '#000000');
  }

  @override
  Future<void> updateTheme(Theme theme) async {
    await _prefs.setString('theme', theme.name);
  }
}
```

---

## Folder Structure for Backend(all backend files must be nested inside a 'backend' folder)
```
lib/
└── backend/
    ├── features/
    │   ├── authentication/
    │   │   ├── data/
    │   │   │   ├── datasources/
    │   │   │   │   ├── firebase_authentication_repository.dart
    │   │   │   ├── models/
    │   │   │   │   ├── user_model.dart
    │   │   │   ├── repositories/
    │   │   │   │   ├── authentication_repository.dart
    │   ├── profile/
    │   │   ├── data/
    │   │   │   ├── datasources/
    │   │   │   │   ├── firestore_profile_repository.dart
    │   │   │   ├── models/
    │   │   │   │   ├── profile_model.dart
    │   │   │   ├── repositories/
    │   │   │   │   ├── profile_repository.dart
    │   ├── history/
    │   │   ├── data/
    │   │   │   ├── datasources/
    │   │   │   │   ├── firestore_history_repository.dart
    │   │   │   ├── models/
    │   │   │   │   ├── history_item_model.dart
    │   │   │   ├── repositories/
    │   │   │   │   ├── history_repository.dart
    │   ├── theme/
    │   │   ├── data/
    │   │   │   ├── datasources/
    │   │   │   │   ├── local_theme_repository.dart
    │   │   │   ├── models/
    │   │   │   │   ├── theme_model.dart
    │   │   │   ├── repositories/
    │   │   │   │   ├── theme_repository.dart
```