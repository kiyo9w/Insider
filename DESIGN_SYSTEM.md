# Design System Documentation

## Overview

This document describes the unified design system for the Insider mobile application, inspired by Perplexity's modern, clean aesthetic. The design system prioritizes consistency, accessibility, and a premium user experience across all platforms.

## Design Philosophy

### Core Principles

1. **Dark-First Design**: The primary design is optimized for dark mode, with sophisticated dark backgrounds and high contrast text
2. **Minimalism**: Clean, uncluttered interfaces with purposeful whitespace
3. **Accessibility**: WCAG 2.1 AA compliant color contrasts and touch targets
4. **Fluidity**: Smooth animations and transitions that feel natural
5. **Consistency**: Unified visual language across all screens and components

### Visual Identity

- **Modern & Professional**: Sophisticated gradient accents with cyan/teal primary colors
- **Content-Forward**: Typography and layout that prioritizes readability
- **Responsive**: Adapts gracefully to different screen sizes and orientations

---

## Color Palette

### Primary Colors

```dart
Primary Cyan:       #20A4F3 (rgb: 32, 164, 243)
Primary Cyan Light: #4CB8FF (rgb: 76, 184, 255)
Primary Cyan Dark:  #1890DB (rgb: 24, 144, 219)
```

**Usage**: Primary actions, links, active states, brand elements

### Background Colors

#### Dark Theme (Primary)
```dart
Background:         #0A0A0A (Almost black)
Background Elevated: #141414 (Raised surfaces)
Background Card:    #1A1A1A (Card containers)
Background Hover:   #202020 (Interactive hover state)
```

#### Light Theme
```dart
Background:         #FFFFFF (Pure white)
Background Elevated: #F8F9FA (Raised surfaces)
Background Card:    #FFFFFF (Card containers)
Background Hover:   #F5F5F5 (Interactive hover state)
```

### Text Colors

#### Dark Theme
```dart
Primary:   #FFFFFF (100% opacity) - Headlines, body text
Secondary: #B4B4B4 (71% opacity)  - Descriptions, metadata
Tertiary:  #6E6E6E (43% opacity)  - Placeholders, hints
Disabled:  #4A4A4A (29% opacity)  - Disabled elements
```

#### Light Theme
```dart
Primary:   #0A0A0A (100% opacity) - Headlines, body text
Secondary: #6E6E6E (57% opacity)  - Descriptions, metadata
Tertiary:  #999999 (40% opacity)  - Placeholders, hints
Disabled:  #BBBBBB (27% opacity)  - Disabled elements
```

### Border Colors

```dart
Dark Theme:  #2A2A2A (Subtle borders), #333333 (Emphasized)
Light Theme: #E5E5E5 (Subtle borders)
```

### Semantic Colors

```dart
Success: #10B981 (Green) - Confirmations, success states
Warning: #F59E0B (Amber) - Warnings, attention needed
Error:   #EF4444 (Red)   - Errors, destructive actions
Info:    #3B82F6 (Blue)  - Information, neutral alerts
```

---

## Typography

### Font Family

- **Primary**: SF Pro Display (iOS), Roboto (Android), System Default (fallback)
- **Monospace**: SF Mono, Consolas (for code)

### Type Scale

| Style | Size | Weight | Line Height | Letter Spacing | Usage |
|-------|------|--------|-------------|----------------|-------|
| Display Large | 34px | Bold (700) | 1.2 | -0.5px | Hero headlines |
| Display Medium | 28px | Bold (700) | 1.25 | -0.3px | Page titles |
| Display Small | 24px | Bold (700) | 1.3 | -0.2px | Section headers |
| Heading Large | 22px | Semibold (600) | 1.35 | -0.1px | Card titles |
| Heading Medium | 18px | Semibold (600) | 1.4 | 0px | Subsection headers |
| Heading Small | 16px | Semibold (600) | 1.4 | 0px | Minor headings |
| Body Large | 16px | Regular (400) | 1.5 | 0px | Primary content |
| Body Medium | 15px | Regular (400) | 1.5 | 0px | Standard text |
| Body Small | 14px | Regular (400) | 1.5 | 0px | Secondary content |
| Caption | 13px | Regular (400) | 1.4 | 0px | Metadata, timestamps |
| Caption Small | 12px | Regular (400) | 1.4 | 0px | Fine print |
| Label | 14px | Medium (500) | 1.4 | 0px | Form labels |
| Button | 15px | Medium (500) | 1.2 | 0.1px | Button text |

### Usage Guidelines

- **Display styles**: Use for hero sections, page titles, and high-impact text
- **Heading styles**: Use for section headers, card titles, and content hierarchy
- **Body styles**: Use for paragraphs, descriptions, and standard content
- **Caption/Label**: Use for metadata, timestamps, form labels, and supporting text

---

## Spacing System

### Scale (8px base unit)

```dart
spacing2:  2px   (0.25× base)
spacing4:  4px   (0.5× base)
spacing6:  6px   (0.75× base)
spacing8:  8px   (1× base)
spacing12: 12px  (1.5× base)
spacing16: 16px  (2× base)
spacing20: 20px  (2.5× base)
spacing24: 24px  (3× base)
spacing32: 32px  (4× base)
spacing40: 40px  (5× base)
spacing48: 48px  (6× base)
spacing64: 64px  (8× base)
```

### Common Patterns

- **Component padding**: 16px (spacing16)
- **Screen margins**: 20px (spacing20)
- **Card padding**: 16px (spacing16)
- **List item spacing**: 12px vertical (spacing12)
- **Section spacing**: 32px (spacing32)
- **Button padding**: 24px horizontal, 12px vertical

---

## Border Radius

```dart
Small:   8px  - Buttons, inputs, small cards
Medium:  12px - Cards, containers
Large:   16px - Large cards, modals
XLarge:  20px - Hero sections
Full:    999px - Pills, circular avatars
```

---

## Shadows & Elevation

### Shadow Levels

```dart
Small:  boxShadow(color: black.opacity(0.08), blur: 8px,  offset: (0, 2px))
Medium: boxShadow(color: black.opacity(0.12), blur: 16px, offset: (0, 4px))
Large:  boxShadow(color: black.opacity(0.16), blur: 24px, offset: (0, 8px))
```

### Elevation System

```dart
Low:    2.0  - Cards, buttons
Medium: 4.0  - Dropdowns, tooltips
High:   8.0  - Modals, popovers
Modal:  16.0 - Full-screen overlays
```

---

## Components

### Buttons

#### Primary Button
- Background: `primaryCyan`
- Text: White
- Height: 48px (default)
- Padding: 24px horizontal, 12px vertical
- Border Radius: 12px
- No shadow in default state

#### Secondary Button
- Background: Transparent
- Text: `primaryCyan`
- Border: 1px solid `primaryCyan`
- Same dimensions as primary

#### Text Button
- Background: Transparent
- Text: `primaryCyan`
- No border
- Padding: 16px horizontal, 8px vertical

### Input Fields

- Height: 48px (default)
- Padding: 16px horizontal, 12px vertical
- Border: 1px solid (borderDark/borderLight)
- Border Radius: 12px
- Background: backgroundElevated
- Focus state: 2px border in primaryCyan

### Cards

- Background: backgroundCard
- Border: 1px solid border color
- Border Radius: 12px
- Padding: 16px
- No shadow in default state

### Bottom Navigation

- Height: 60px
- Background: backgroundDark/backgroundLight
- Selected color: primaryCyan
- Unselected color: textSecondary
- Icon size: 24-26px
- Label size: 11px

### App Bar

- Height: 56px
- Background: backgroundDark/backgroundLight
- No elevation
- Icon size: 24px

---

## Animation & Transitions

### Durations

```dart
Fast:   150ms - Quick feedback (hover, ripple)
Normal: 250ms - Standard transitions (page changes)
Slow:   350ms - Emphasis (modals, drawers)
```

### Curves

```dart
Default:      easeInOut     - Standard transitions
Emphasized:   easeOutCubic  - Entrances, expansions
Deemphasized: easeInCubic   - Exits, collapses
```

### Common Animations

- **Page transitions**: 250ms easeInOut
- **Modal open**: 350ms easeOutCubic
- **Hover states**: 150ms easeInOut
- **Button press**: 150ms easeInOut

---

## Dimensions

### Standard Sizes

```dart
App Bar Height:     56px
Bottom Nav Height:  60px
Input Height:       48px (default)
Button Height:      44px (medium)
Icon Size:          20-24px (standard)
Avatar Small:       32px
Avatar Medium:      40px
Avatar Large:       56px
```

---

## Accessibility Guidelines

### Color Contrast

- All text must meet WCAG 2.1 AA standards (4.5:1 for normal text, 3:1 for large text)
- Interactive elements have sufficient contrast in all states

### Touch Targets

- Minimum touch target: 44×44px
- Recommended: 48×48px for primary actions
- Adequate spacing between interactive elements (8px minimum)

### Typography

- Minimum font size: 12px for supporting text
- Body text: 14-16px for comfortable reading
- Line height: 1.4-1.5 for body text

---

## Implementation

### Flutter Code Example

```dart
import 'package:insider/core/design_system/design_system.dart';

// Using colors
Container(
  color: DesignSystem.backgroundDark,
  child: Text(
    'Hello World',
    style: DesignSystem.headingMedium.copyWith(
      color: DesignSystem.textPrimaryDark,
    ),
  ),
)

// Using spacing
Padding(
  padding: const EdgeInsets.all(DesignSystem.spacing16),
  child: ...
)

// Using border radius
Container(
  decoration: BoxDecoration(
    borderRadius: DesignSystem.borderRadiusMedium,
  ),
)
```

### Theme Access

```dart
import 'package:insider/core/design_system/app_theme_v2.dart';

MaterialApp(
  theme: AppThemeV2.lightTheme,
  darkTheme: AppThemeV2.darkTheme,
  themeMode: ThemeMode.dark, // or ThemeMode.system
)
```

---

## Best Practices

1. **Always use design tokens** - Never hardcode colors, sizes, or spacing
2. **Maintain hierarchy** - Use typography scale to establish clear visual hierarchy
3. **Consistent spacing** - Use the 8px grid system for all layouts
4. **Dark mode first** - Design and test in dark mode, then adapt to light
5. **Responsive design** - Test on multiple screen sizes and orientations
6. **Performance** - Optimize images, minimize animations, lazy load content
7. **Accessibility** - Always consider users with different abilities

---

## Maintenance

### When to Update

- New component patterns emerge
- User feedback indicates confusion or difficulty
- Brand evolution or rebranding
- New platform guidelines (iOS/Android)

### Version History

- **v1.0.0** (November 2025) - Initial design system based on Perplexity inspiration

---

## Resources

- Figma Design File: [Link to Figma]
- Component Library: `lib/core/design_system/`
- Theme Configuration: `lib/core/design_system/app_theme_v2.dart`
- Reference Images: `references/` directory

---

*This design system is a living document. Contributions and improvements are welcome.*


