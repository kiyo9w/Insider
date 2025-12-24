# AuthCubit Singleton Fix - Multiple Instances Problem

## Problem
After successful login, the token and user data were saved correctly, but screens like `ThreadsScreen` and `SettingPage` didn't update to show the authenticated state. They continued to show the "Guest" or "Not logged in" UI.

## Root Cause

### The Issue: Multiple AuthCubit Instances

`AuthCubit` was registered as a **Factory** in the dependency injection:

```dart
// lib/injector/modules/bloc_module.dart (BEFORE)
..registerFactory<AuthCubit>(  // ❌ Creates NEW instance each time
  () => AuthCubit(
    authRepository: injector(),
    localStorageService: injector(),
    notificationService: injector(),
  ),
)
```

**What this means:**
- Every time a screen requests `AuthCubit`, it gets a **brand new instance**
- Each instance has its own separate state
- When you login, only ONE instance's state updates
- Other screens with their own instances don't know about the login

### The Evidence

Looking at the code:

1. **`app.dart` (line 69)**: Creates AuthCubit instance #1
   ```dart
   BlocProvider<AuthCubit>(
     create: (_) => Injector.instance<AuthCubit>(),  // Instance #1
   )
   ```

2. **`tablet_main_screen.dart` (line 35)**: Creates AuthCubit instance #2
   ```dart
   return BlocProvider<AuthCubit>(
     create: (_) => Injector.instance<AuthCubit>(),  // Instance #2 ❌
     child: Scaffold(...)
   )
   ```

3. **`threads_screen.dart` (line 84)**: Uses AuthCubit from parent
   ```dart
   BlocBuilder<AuthCubit, AuthState>(  // Tries to use instance from parent
     builder: (context, state) {
       final isLoggedIn = state.user != null;  // But which instance?
   ```

4. **`setting_page.dart` (line 22)**: Uses AuthCubit from parent
   ```dart
   BlocBuilder<AuthCubit, AuthState>(  // Tries to use instance from parent
     builder: (context, state) {
       final isAuthenticated = state.isAuthenticated;  // But which instance?
   ```

### The Flow (BEFORE Fix)

```
User logs in
  ↓
EmailSignInScreen uses AuthCubit Instance #1
  ↓
Instance #1 state: isAuthenticated = true ✅
  ↓
TabletMainScreen creates AuthCubit Instance #2
  ↓
Instance #2 state: isAuthenticated = false ❌ (new instance, never logged in)
  ↓
ThreadsScreen reads from Instance #2
  ↓
Shows "Guest" UI ❌
  ↓
SettingPage reads from Instance #2
  ↓
Shows "Not logged in" UI ❌
```

## The Fix

### 1. Changed AuthCubit to Singleton

```dart
// lib/injector/modules/bloc_module.dart (AFTER)
..registerLazySingleton<AuthCubit>(  // ✅ Single shared instance
  () => AuthCubit(
    authRepository: injector(),
    localStorageService: injector(),
    notificationService: injector(),
  ),
)
```

**What this means:**
- Only ONE instance of `AuthCubit` exists in the entire app
- All screens share the same instance
- When state changes, ALL screens see the change

### 2. Removed Duplicate BlocProvider

```dart
// lib/features/main/view/tablet_main_screen.dart (BEFORE)
return BlocProvider<AuthCubit>(
  create: (_) => Injector.instance<AuthCubit>(),  // ❌ Creating new instance
  child: Scaffold(...)
)

// lib/features/main/view/tablet_main_screen.dart (AFTER)
return Scaffold(...)  // ✅ Uses AuthCubit from parent widget tree
```

The `TabletMainScreen` now uses the `AuthCubit` provided by `app.dart` instead of creating its own.

## The Flow (AFTER Fix)

```
User logs in
  ↓
EmailSignInScreen uses AuthCubit (Singleton Instance)
  ↓
Singleton state: isAuthenticated = true ✅
  ↓
AppDirector reads from Singleton
  ↓
Shows MainShell ✅
  ↓
TabletMainScreen uses Singleton (from parent)
  ↓
ThreadsScreen reads from Singleton
  ↓
Shows authenticated UI ✅
  ↓
SettingPage reads from Singleton
  ↓
Shows authenticated UI with user name ✅
```

## Files Modified

1. **lib/injector/modules/bloc_module.dart**
   - Changed `registerFactory<AuthCubit>` to `registerLazySingleton<AuthCubit>`

2. **lib/features/main/view/tablet_main_screen.dart**
   - Removed `BlocProvider<AuthCubit>` wrapper
   - Removed unused imports (`flutter_bloc`, `auth_cubit`, `injector`)

## Why This Pattern is Correct

### Singleton vs Factory - When to Use Each

**Use Singleton for:**
- ✅ **Authentication state** - Should be shared across the entire app
- ✅ **App-wide settings** - Theme, locale, etc.
- ✅ **Global state** - User session, app configuration

**Use Factory for:**
- ✅ **Screen-specific state** - Form state, local UI state
- ✅ **Disposable state** - State that should be recreated each time
- ✅ **Independent instances** - When you want separate instances

### Why AuthCubit Should Be Singleton

1. **Single Source of Truth**: Authentication state should be consistent across the entire app
2. **Session Management**: User session is global, not screen-specific
3. **State Synchronization**: All screens should react to auth changes simultaneously
4. **Memory Efficiency**: No need for multiple instances tracking the same data

## Testing the Fix

1. ✅ **Login** → All screens should show authenticated state
2. ✅ **ThreadsScreen** → Should show user's threads and name in header
3. ✅ **SettingPage** → Should show user's name and "Sign out" button
4. ✅ **Close and reopen app** → All screens remain authenticated
5. ✅ **Logout** → All screens should show unauthenticated state
6. ✅ **Register** → All screens should show authenticated state

## Verification Logs

After login, you should see the same user state in all screens:

```
I/flutter: AuthCubit: login started for user@example.com
I/flutter: LocalStorageSecureService: setValue key=accessToken, value=<token>
I/flutter: AuthCubit: Saving user <user-id>
I/flutter: LocalStorageSecureService: setValue key=user, value=<json>
```

Then:
- **AppDirector**: Shows MainShell (authenticated)
- **ThreadsScreen**: Shows user name in header
- **SettingPage**: Shows user name and "Sign out" button

## Related Fixes

This fix complements:
1. **Session Persistence Fix** (`SESSION_PERSISTENCE_FIX.md`) - Ensures tokens are properly saved
2. **UI Update Fix** (`UI_NOT_UPDATING_AFTER_LOGIN_FIX.md`) - Ensures AppDirector reacts to auth changes

Together, these three fixes ensure:
✅ Single shared authentication state across the app
✅ Proper token persistence across app restarts
✅ Reactive UI that updates when auth state changes
✅ Consistent user experience across all screens

## Common Pitfall

**❌ Don't do this:**
```dart
BlocProvider<AuthCubit>(
  create: (_) => Injector.instance<AuthCubit>(),  // Creates new instance!
  child: MyScreen(),
)
```

**✅ Do this instead:**
```dart
// Just use the AuthCubit from the parent widget tree
BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    // This will use the singleton instance
  },
)
```

## Architecture Diagram

```
App Widget Tree
├── AppBloc (Singleton) ✅
├── AuthCubit (Singleton) ✅ ← ONE instance for entire app
│   └── State: { isAuthenticated, user, token }
│
├── AppDirector
│   └── Listens to AuthCubit ✅
│       ├── Shows AuthScreen if not authenticated
│       └── Shows MainShell if authenticated
│
├── MainShell
│   ├── TabletMainScreen
│   │   ├── ThreadsView
│   │   │   └── Reads AuthCubit.state.user ✅
│   │   └── ChatView
│   │       └── Reads AuthCubit.state.user ✅
│   └── ChatScreen
│
└── SettingPage
    └── Reads AuthCubit.state.isAuthenticated ✅
```

All screens read from the **same AuthCubit instance**, so they all see the same state!



