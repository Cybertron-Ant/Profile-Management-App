
# Frontend Documentation

## 1. Authentication

### UI Components
- **Login Screen**:
  - Email and password input fields.
  - "Login" button.
  - "Sign Up" link to navigate to the signup screen.
  
- **Signup Screen**:
  - Name, email, and password input fields.
  - "Sign Up" button.
  - "Login" link to navigate to the login screen.

### State Management
- **Use `flutter_bloc` for state management**.
- **AuthenticationBloc**:
  - **States**: `AuthenticationInitial`, `AuthenticationLoading`, `AuthenticationSuccess`, `AuthenticationFailure`.
  - **Events**: `LoginUser`, `SignUpUser`.

### Navigation
- Use `Navigator` to switch between login and signup screens.
- After successful login/signup, navigate to the **Profile Screen**.

---

## 2. Profile

### UI Components
- **Profile Screen**:
  - Profile picture (editable).
  - Name, email, and bio fields (editable).
  - "Save" button to update the profile.
  - Navigation to **Settings Screen** and **History Screen**.

- **Edit Profile Form**:
  - Text fields for name, email, and bio.
  - "Save" and "Cancel" buttons.

### State Management
- **Use `flutter_bloc` for state management**.
- **ProfileBloc**:
  - **States**: `ProfileInitial`, `ProfileLoading`, `ProfileLoaded`, `ProfileError`.
  - **Events**: `GetProfile`, `UpdateProfile`.

### Navigation
- Use `Navigator` to navigate to the **Edit Profile Form**.
- Use `BottomNavigationBar` to switch between **Profile**, **Settings**, and **History** screens.

---

## 3. Settings

### UI Components
- **Settings Screen**:
  - Toggle switches for notifications and privacy settings.
  - Dropdown for app preferences (e.g., theme, language).
  - "Save" button to update settings.

### State Management
- **Use `flutter_bloc` for state management**.
- **SettingsBloc**:
  - **States**: `SettingsInitial`, `SettingsLoading`, `SettingsLoaded`, `SettingsError`.
  - **Events**: `GetSettings`, `UpdateSettings`.

### Navigation
- Use `BottomNavigationBar` to switch between **Profile**, **Settings**, and **History** screens.

---

## 4. History

### UI Components
- **History Screen**:
  - List of recent activity (e.g., interactions, downloads).
  - "Download" button for each item.
  - "Clear History" button.

### State Management
- **Use `flutter_bloc` for state management**.
- **HistoryBloc**:
  - **States**: `HistoryInitial`, `HistoryLoading`, `HistoryLoaded`, `HistoryError`.
  - **Events**: `GetHistory`, `ClearHistory`.

### Navigation
- Use `BottomNavigationBar` to switch between **Profile**, **Settings**, and **History** screens.

---

## 5. Theme

### UI Components
- **Theme Picker**:
  - Dropdown or color picker for selecting themes.
  - "Apply" button to save the selected theme.

### State Management
- **Use `flutter_bloc` for state management**.
- **ThemeBloc**:
  - **States**: `ThemeInitial`, `ThemeLoading`, `ThemeLoaded`, `ThemeError`.
  - **Events**: `GetTheme`, `UpdateTheme`.

### Navigation
- Accessible from the **Settings Screen**.

---

## 6. Modern Design
- **Gradient Background**: Use `LinearGradient` for the profile container.
- **Animations**: Use `Lottie` for smooth animations (e.g., loading, transitions).
- **Custom UI Components**: Create reusable widgets (e.g., `GradientButton`, `AnimatedTextField`).

---

## 7. Landing Page

### UI Components
- **Landing Screen**:
  - App logo and tagline.
  - "Login" and "Sign Up" buttons.
  - Navigation to **Profile Screen** after login.

### State Management
- **Use `flutter_bloc` for state management**.
- **LandingBloc**:
  - **States**: `LandingInitial`, `LandingLoading`, `LandingSuccess`.
  - **Events**: `NavigateToProfile`.

### Navigation
- Use `Navigator` to switch between the **Landing Screen** and **Profile Screen**.

---

## 8. Third-Party Libraries
- **State Management**: `flutter_bloc` or `flutter_bloc`
- **Firebase Integration**: `firebase_core`, `firebase_auth`, `cloud_firestore`.
- **Local Storage**: `shared_preferences` or `hive`.
- **Animations**: `lottie`.
- **Loading Effects**: `shimmer`.

---

## 9. Folder Structure for Frontend(all frontend files must be nested inside a 'frontend' folder)
```
lib/
├── frontend/
│   ├── features/
│   │   ├── authentication/
│   │   │   ├── presentation/
│   │   │   │   ├── bloc/
│   │   │   │   │   ├── authentication_bloc.dart
│   │   │   │   │   ├── authentication_event.dart
│   │   │   │   │   ├── authentication_state.dart
│   │   │   ├── pages/
│   │   │   │   ├── login_screen.dart
│   │   │   │   ├── signup_screen.dart
│   │   │   ├── widgets/
│   │   │   │   ├── login_form.dart
│   │   │   │   ├── signup_form.dart
│   │   ├── profile/
│   │   │   ├── presentation/
│   │   │   │   ├── bloc/
│   │   │   │   │   ├── profile_bloc.dart
│   │   │   │   │   ├── profile_event.dart
│   │   │   │   │   ├── profile_state.dart
│   │   │   ├── pages/
│   │   │   │   ├── profile_screen.dart
│   │   │   │   ├── edit_profile_screen.dart
│   │   │   ├── widgets/
│   │   │   │   ├── profile_picture.dart
│   │   │   │   ├── profile_form.dart
│   │   ├── settings/
│   │   │   ├── presentation/
│   │   │   │   ├── bloc/
│   │   │   │   │   ├── settings_bloc.dart
│   │   │   │   │   ├── settings_event.dart
│   │   │   │   │   ├── settings_state.dart
│   │   │   ├── pages/
│   │   │   │   ├── settings_screen.dart
│   │   ├── widgets/
│   │   │   │   ├── settings_form.dart
│   │   ├── history/
│   │   │   ├── presentation/
│   │   │   │   ├── bloc/
│   │   │   │   │   ├── history_bloc.dart
│   │   │   │   │   ├── history_event.dart
│   │   │   │   │   ├── history_state.dart
│   │   │   ├── pages/
│   │   │   │   ├── history_screen.dart
│   │   ├── widgets/
│   │   │   │   ├── history_list.dart
│   │   ├── theme/
│   │   │   ├── presentation/
│   │   │   │   ├── bloc/
│   │   │   │   │   ├── theme_bloc.dart
│   │   │   │   │   ├── theme_event.dart
│   │   │   │   │   ├── theme_state.dart
│   │   │   ├── pages/
│   │   │   │   ├── theme_picker.dart
│   │   ├── widgets/
│   │   │   │   ├── theme_selector.dart
│   ├── core/
│   │   ├── widgets/
│   │   │   ├── gradient_button.dart
│   │   │   ├── animated_text_field.dart
```