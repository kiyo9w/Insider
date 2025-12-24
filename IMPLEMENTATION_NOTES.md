# Implementation Notes - Quick Reference

## What Was Built

### 🎨 Design System
- **File**: `lib/core/design_system/design_system.dart`
- **Documentation**: `DESIGN_SYSTEM.md`
- **Theme**: `lib/core/design_system/app_theme_v2.dart`

Complete design system with:
- Color palette (dark-first, cyan accents)
- Typography scale (13 text styles)
- Spacing system (8px grid)
- Component tokens
- Animation standards

### 📱 Three Main Screens

#### 1. Threads Screen
- **Path**: `lib/features/threads/view/threads_screen.dart`
- Shows conversation history
- Search bar for threads
- Thread preview cards

#### 2. Chat Screen (Home)
- **Path**: `lib/features/chat/view/chat_screen.dart`
- Centered Perplexity logo
- Bottom input bar with attachments/voice
- Ready for message integration

#### 3. Discovery Screen
- **Path**: `lib/features/discovery/view/discovery_screen.dart`
- News feed with category tabs
- Article cards with images
- Like/bookmark/share actions

### 🧭 Navigation
- **Path**: `lib/features/main/view/main_shell.dart`
- Bottom navigation bar
- Three tabs: Threads, Home, Discover
- Persistent navigation

### 🔧 Updated Files
- `lib/router/app_router.dart` - Added MainShell route
- `lib/features/app/view/app.dart` - Integrated new theme

## How to Use the Design System

```dart
import 'package:insider/core/design_system/design_system.dart';

// Colors
DesignSystem.primaryCyan
DesignSystem.backgroundDark
DesignSystem.textPrimaryDark

// Typography
DesignSystem.headingMedium
DesignSystem.bodyMedium

// Spacing
DesignSystem.spacing16
DesignSystem.spacing24

// Border Radius
DesignSystem.borderRadiusMedium
DesignSystem.borderRadiusLarge

// Shadows
DesignSystem.shadowMedium
```

## Running the App

```bash
# Get dependencies
flutter pub get

# Run the app
flutter run

# The app will open to the MainShell with three tabs
```

## Next Priority Tasks

1. **Integrate flutter_chat_ui**
   - Study reference code in `references/`
   - Implement ChatController
   - Create message widgets
   - Add streaming support

2. **Connect to Backend**
   - API client for `/api/v1/workflow/simple_qa/completions`
   - Handle streaming responses
   - Process ChatMessage objects

3. **Add State Management**
   - Create BLoC for chat features
   - Implement message state
   - Add loading/error states

## Design Principles

1. **Always use DesignSystem constants** - Never hardcode
2. **Dark mode first** - Primary design target
3. **8px grid system** - All spacing must align
4. **Responsive** - Test on multiple screen sizes
5. **Accessible** - Meet WCAG 2.1 AA standards

## File Organization

```
lib/
├── core/design_system/    ← Design tokens
├── features/
│   ├── main/             ← Navigation shell
│   ├── threads/          ← Threads screen
│   ├── chat/             ← Chat screen
│   └── discovery/        ← Discovery screen
└── router/               ← Navigation config
```

## Important Notes

- **Mock Data**: All screens use placeholder data currently
- **No Backend**: Not connected to API yet
- **No Persistence**: No local storage implemented yet
- **Reference Code**: Available in `references/` (use cautiously)
- **flutter_chat_ui**: Locally cloned in `packages/flutter_chat_ui-2.6.1/`

## Testing New Features

When adding new features:
1. Use design system tokens
2. Follow existing patterns (see `main_shell.dart`, screen files)
3. Match Perplexity's aesthetic
4. Test in both light and dark modes
5. Ensure responsive behavior

## Common Patterns

### Screen Structure
```dart
class MyScreen extends StatefulWidget {
  const MyScreen({super.key});
  
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark 
        ? DesignSystem.backgroundDark 
        : DesignSystem.backgroundLight,
      body: SafeArea(
        child: // Your content
      ),
    );
  }
}
```

### Theme-Aware Colors
```dart
final textColor = isDark 
  ? DesignSystem.textPrimaryDark 
  : DesignSystem.textPrimaryLight;
```

### Custom Widgets
```dart
class _MyWidget extends StatelessWidget {
  const _MyWidget({
    required this.title,
    required this.isDark,
  });

  final String title;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DesignSystem.spacing16),
      decoration: BoxDecoration(
        color: isDark 
          ? DesignSystem.backgroundDarkCard 
          : DesignSystem.backgroundLightCard,
        borderRadius: DesignSystem.borderRadiusMedium,
      ),
      child: Text(
        title,
        style: DesignSystem.bodyMedium.copyWith(
          color: isDark 
            ? DesignSystem.textPrimaryDark 
            : DesignSystem.textPrimaryLight,
        ),
      ),
    );
  }
}
```

## Documentation

- **Design System**: `DESIGN_SYSTEM.md` - Complete design tokens reference
- **Project Summary**: `PROJECT_SUMMARY.md` - Full project overview and roadmap
- **This File**: Quick reference for developers

## Questions?

Refer to:
1. `PROJECT_SUMMARY.md` for big picture
2. `DESIGN_SYSTEM.md` for design details
3. Existing screen files for patterns
4. `references/` for chat UI integration ideas (use cautiously)

---

**Status**: ✅ Foundation Complete  
**Next**: Integrate chat functionality and backend API  
**Theme**: Dark-first, Perplexity-inspired  
**Design System**: Fully documented and implemented


