
# Third-Party Libraries Documentation

## 1. Core Libraries
These libraries are essential for the app’s core functionality and are used across multiple features.

| Library               | Purpose                                              | Usage                                                |
|-----------------------|------------------------------------------------------|------------------------------------------------------|
| **flutter_bloc**       | State management using the BLoC pattern.             | Manage app-wide and feature-specific state (e.g., authentication, profile). |
| **equatable**          | Simplify value comparison in BLoC states and events. | Reduce boilerplate code in state management.         |
| **get_it**             | Dependency injection for managing service instances. | Inject repositories and services into BLoCs and widgets. |
| **shared_preferences** | Local storage for persisting user preferences (e.g., theme). | Store and retrieve theme preferences.               |
| **hive**               | Lightweight and fast local database for caching user data. | Cache user data (e.g., profile, history) for offline access. |
| **flutter_localizations** | Support for multiple languages and locales.         | Localize the app for different regions.              |

---

## 2. Authentication
These libraries are specific to the Authentication feature.

| Library               | Purpose                                               | Usage                                               |
|-----------------------|-------------------------------------------------------|-----------------------------------------------------|
| **firebase_core**      | Initialize Firebase services.                        | Set up Firebase in the app.                         |
| **firebase_auth**      | Handle user authentication (e.g., email/password, social login). | Implement login, signup, and logout functionality.  |
| **google_sign_in**     | Enable Google Sign-In for authentication.            | Add social login with Google.                       |
| **flutter_facebook_auth** | Enable Facebook Sign-In for authentication.         | Add social login with Facebook.                     |

---

## 3. Profile Management
These libraries are specific to the Profile feature.

| Library               | Purpose                                               | Usage                                               |
|-----------------------|-------------------------------------------------------|-----------------------------------------------------|
| **cloud_firestore**    | Store and retrieve user profile data in Firestore.    | Manage user profile data (e.g., name, email, bio).  |
| **firebase_storage**   | Store and retrieve profile pictures in Firebase Storage. | Upload and display user profile pictures.           |
| **image_picker**       | Allow users to select or capture profile pictures.    | Enable profile picture uploads from the device gallery or camera. |
| **cached_network_image** | Cache and display network images (e.g., profile pictures). | Improve performance by caching profile pictures.    |

---

## 4. History Management
These libraries are specific to the History feature.

| Library               | Purpose                                               | Usage                                               |
|-----------------------|-------------------------------------------------------|-----------------------------------------------------|
| **cloud_firestore**    | Store and retrieve user history data in Firestore.    | Manage user activity history (e.g., interactions, downloads). |
| **fluttertoast**       | Display toast messages for user feedback.             | Notify users of successful or failed history actions. |

---

## 5. Theme Management
These libraries are specific to the Theme feature.

| Library               | Purpose                                               | Usage                                               |
|-----------------------|-------------------------------------------------------|-----------------------------------------------------|
| **shared_preferences** | Persist theme preferences locally.                    | Store and retrieve user-selected themes.            |
| **provider**           | Manage theme state and provide it to the app.         | Sync theme changes across the app.                  |

---

## 6. Animations and UI Enhancements
These libraries enhance the app’s visual appeal and user experience.

| Library               | Purpose                                               | Usage                                               |
|-----------------------|-------------------------------------------------------|-----------------------------------------------------|
| **lottie**             | Add smooth animations to the app.                     | Animate loading states, transitions, and other UI elements. |
| **shimmer**            | Display shimmer effects for loading states.           | Improve perceived performance during data loading.  |
| **flutter_spinkit**    | Add customizable loading spinners.                    | Display loading indicators during API calls.        |
| **flutter_svg**        | Render SVG images in the app.                         | Display scalable vector graphics (e.g., icons, illustrations). |

---

## 7. Networking and API Communication
These libraries handle API communication and network-related tasks.

| Library               | Purpose                                               | Usage                                               |
|-----------------------|-------------------------------------------------------|-----------------------------------------------------|
| **dio**               | Make HTTP requests to external APIs.                  | Fetch data from third-party APIs (if needed).       |
| **http**              | Alternative to dio for simpler HTTP requests.         | Fetch data from third-party APIs (if needed).       |
| **connectivity_plus** | Check network connectivity status.                    | Handle offline mode and network errors.            |

---

## 8. Testing
These libraries are used for testing the app.

| Library               | Purpose                                               | Usage                                               |
|-----------------------|-------------------------------------------------------|-----------------------------------------------------|
| **mockito**            | Create mocks for unit and integration tests.          | Mock Firebase and other external dependencies.      |
| **flutter_test**       | Write unit and widget tests for Flutter apps.         | Test individual components and widgets.             |
| **flutter_driver**     | Write end-to-end tests for user flows.                | Test complete user journeys (e.g., login → profile → history). |

---

## 9. DevOps and Monitoring
These libraries are used for deployment, monitoring, and error tracking.

| Library               | Purpose                                               | Usage                                               |
|-----------------------|-------------------------------------------------------|-----------------------------------------------------|
| **firebase_crashlytics** | Track and report app crashes.                        | Monitor app stability and fix bugs.                 |
| **sentry**             | Alternative to Crashlytics for error tracking.        | Monitor app stability and fix bugs.                 |
| **github_actions**     | Automate CI/CD pipelines for the app.                 | Deploy the app to Firebase Hosting or other platforms. |

---

## Folder Structure for Third-Party Libraries
```
lib/
├── core/
│   ├── dependencies/
│   │   ├── third_party_libraries.md
```

---

## Third-Party Libraries Usage Guidelines

### Versioning:
- Always use the latest stable version of each library.
- Specify versions in `pubspec.yaml` to avoid compatibility issues.

### Security:
- Use libraries with active maintenance and good security practices.
- Avoid libraries with known vulnerabilities.

### Performance:
- Optimize library usage to minimize app size and improve performance.
- Use lazy loading for large libraries (e.g., `firebase_storage`).

### Compatibility:
- Ensure all libraries are compatible with the latest Flutter version.
- Test libraries together to avoid conflicts.
