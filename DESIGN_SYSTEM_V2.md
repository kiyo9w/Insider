# Insider Design System V2
## Perplexity-Inspired Mobile UI

*Last Updated: November 17, 2025*
*Version: 2.0.0*

---

## Overview

This design system defines the visual language and interaction patterns for the Insider mobile application. It is heavily inspired by Perplexity's modern, clean aesthetic while maintaining our unique brand identity.

### Design Philosophy

1. **Dark-First Design** - Optimized for dark mode with elegant light mode support
2. **Minimalist Elegance** - Clean interfaces with purposeful use of space
3. **Smooth Interactions** - Fluid animations and transitions throughout
4. **Typography Hierarchy** - Clear information hierarchy through consistent type scales
5. **Cyan Accent System** - Strategic use of cyan/teal gradient for key interactions

---

## Color System

### Primary Colors

```dart
Primary Cyan: #20A4F3
Primary Cyan Light: #4CB8FF
Primary Cyan Dark: #1890DB
```

**Usage**: Primary actions, links, focus states, brand elements, Pro badges

### Dark Theme (Primary)

```dart
Background Base: #0A0A0A (Pure black base)
Background Elevated: #141414 (Cards, elevated surfaces)
Background Card: #1A1A1A (Content cards)
Background Hover: #202020 (Interactive states)

Text Primary: #FFFFFF (Headings, primary content)
Text Secondary: #B4B4B4 (Supporting text)
Text Tertiary: #6E6E6E (Hints, disabled text)
Text Disabled: #4A4A4A (Truly disabled elements)

Border: #2A2A2A (Default borders)
Border Subtle: #333333 (Very subtle divisions)

Icon: #B4B4B4 (Default icon color)
```

### Light Theme

```dart
Background Base: #FFFFFF
Background Elevated: #F8F9FA
Background Card: #FFFFFF
Background Hover: #F5F5F5

Text Primary: #0A0A0A
Text Secondary: #6E6E6E
Text Tertiary: #999999
Text Disabled: #BBBBBB

Border: #E5E5E5
Icon: #6E6E6E
```

### Semantic Colors

```dart
Success: #10B981
Warning: #F59E0B
Error: #EF4444
Info: #3B82F6
```

---

## Typography

### Font Stack

- **Primary**: SF Pro Display (System default on iOS/macOS)
- **Monospace**: SF Mono (for code, technical content)

### Type Scale

| Style | Size | Weight | Line Height | Letter Spacing | Usage |
|-------|------|--------|-------------|----------------|-------|
| Display Large | 34px | 700 | 1.2 | -0.5px | Hero text, major headings |
| Display Medium | 28px | 700 | 1.25 | -0.3px | Section headers |
| Display Small | 24px | 700 | 1.3 | -0.2px | Card titles |
| Heading Large | 22px | 600 | 1.35 | -0.1px | Screen titles |
| Heading Medium | 18px | 600 | 1.4 | 0px | Subsection headers |
| Heading Small | 16px | 600 | 1.4 | 0px | List item titles |
| Body Large | 16px | 400 | 1.5 | 0px | Primary body text |
| Body Medium | 15px | 400 | 1.5 | 0px | Secondary body text |
| Body Small | 14px | 400 | 1.5 | 0px | Captions, fine print |
| Label | 14px | 500 | 1.4 | 0px | Form labels |
| Caption | 13px | 400 | 1.4 | 0px | Timestamps, metadata |
| Button | 15px | 500 | 1.2 | 0.1px | Button text |

---

## Spacing System

Uses an 4px base unit:

```dart
spacing2: 2px   (Micro spacing)
spacing4: 4px   (Tight spacing)
spacing6: 6px   (Very small)
spacing8: 8px   (Small)
spacing12: 12px (Medium-small)
spacing16: 16px (Medium - most common)
spacing20: 20px (Medium-large)
spacing24: 24px (Large)
spacing32: 32px (XL)
spacing40: 40px (XXL)
spacing48: 48px (3XL)
spacing64: 64px (4XL)
```

### Common Applications

- **Screen Padding**: 16-20px horizontal
- **Card Padding**: 16px
- **Element Spacing**: 8-12px between related elements
- **Section Spacing**: 24-32px between sections
- **Input Padding**: 12-16px

---

## Border Radius System

```dart
Small: 8px   (Small buttons, chips)
Medium: 12px (Cards, inputs, standard buttons)
Large: 16px  (Large cards, modals)
XLarge: 20px (Hero elements)
Full: 999px  (Pills, circular elements)
```

---

## Component Specifications

### Buttons

#### Primary Button
- **Height**: 56px
- **Border Radius**: 16px
- **Background**: Cyan gradient (left to right)
- **Text**: White, Body Large, Semibold
- **Shadow**: Cyan glow (opacity 0.4, blur 20px, offset 0,8)
- **States**: 
  - Default: Full gradient
  - Pressed: Scale 0.98, opacity 0.9
  - Disabled: Grayscale, opacity 0.5

#### Secondary Button
- **Height**: 56px
- **Border Radius**: 16px
- **Background**: Elevated surface color
- **Border**: 1.5px solid border color
- **Text**: Primary text color, Body Large, Semibold
- **Shadow**: None
- **Icon**: Optional 24px icon

### Input Fields

#### Standard Text Input
- **Min Height**: 56px
- **Border Radius**: 16px
- **Background**: Elevated surface color
- **Border**: 1px solid border color
- **Padding**: 16px horizontal
- **Placeholder**: Tertiary text color
- **Focus State**: 2px cyan border, cyan shadow (blur 20px)
- **Icon**: 20-24px prefix/suffix icons

#### Search Input (Compact)
- **Height**: 40px
- **Border Radius**: 20px (pill shape)
- **Background**: Elevated surface color
- **Border**: 1px solid border color
- **Icon**: Search icon prefix
- **Padding**: 12px horizontal

#### Chat Input (Special)
- **Min Height**: 88px (3.5 lines)
- **Border Radius**: 28px
- **Background**: Card surface color
- **Border**: 1.5-2px solid (animated on focus)
- **Text Area**: 2 lines minimum
- **Icon Row**: Bottom-aligned, 40-44px icons
- **Send Button**: Circular gradient button (44px)
- **Shadow**: Dynamic - subtle default, cyan glow on focus

### Cards

#### News/Article Card
- **Border Radius**: 12px
- **Background**: Card surface color
- **Border**: 1px solid border color
- **Image Aspect**: 16:9
- **Padding**: 16px content padding
- **Title**: Heading Small
- **Meta**: Caption text with time icon
- **Actions**: Icon buttons at bottom (20px icons)

#### Thread List Item
- **Padding**: 12px vertical
- **Border**: None (divider between items)
- **Title**: Body Medium, Medium weight
- **Preview**: Body Small, Secondary color
- **Meta**: Caption Small with time icon
- **Actions**: More icon (20px)

### Avatars

```dart
Small: 32px  (Mini profile)
Medium: 40px (Default profile)
Large: 56px  (Profile screen)
```

- **Shape**: Circle
- **Border**: Optional 2px cyan gradient border for active state
- **Shadow**: Cyan glow (opacity 0.3, blur 8px) for primary avatars

### Navigation

#### Top Bar
- **Height**: 56px
- **Padding**: 16px horizontal, 12px vertical
- **Border**: 0.5px bottom border
- **Icons**: 24-26px
- **Avatar**: 36-40px

#### Bottom Navigation
- **Height**: 60px (if used)
- **Icons**: 24px
- **Label**: Caption Small
- **Selected**: Cyan color with medium weight
- **Unselected**: Secondary text color

---

## Animations & Transitions

### Duration Scale

```dart
Fast: 150ms    (Micro-interactions, hovers)
Normal: 250ms  (Standard transitions)
Slow: 350ms    (Complex animations)
```

### Curves

- **Default**: easeInOut (most interactions)
- **Emphasized**: easeOutCubic (entrances, expansions)
- **Deemphasized**: easeInCubic (exits, collapses)

### Common Animations

1. **Page Transitions**: 250ms slide with fade
2. **Modal Entry**: 300ms scale (0.95 → 1.0) + fade
3. **Button Press**: 150ms scale (1.0 → 0.98)
4. **Input Focus**: 200ms border color + shadow
5. **Card Hover**: 200ms elevation + border color
6. **Loading Pulse**: 1500ms repeat, ease-in-out

---

## Shadows & Elevation

### Shadow Levels

```dart
Level 1 (Subtle):
  - Color: Black @ 8% opacity
  - Blur: 8px
  - Offset: 0, 2px

Level 2 (Standard):
  - Color: Black @ 12% opacity
  - Blur: 16px
  - Offset: 0, 4px

Level 3 (Elevated):
  - Color: Black @ 16% opacity
  - Blur: 24px
  - Offset: 0, 8px

Cyan Glow:
  - Color: Cyan @ 25-50% opacity
  - Blur: 16-24px
  - Offset: 0, 4-8px
```

---

## Icon System

### Sizes

```dart
Small: 16px   (Inline with text)
Medium: 20px  (Standard icons)
Large: 24px   (Navigation, headers)
XLarge: 32px  (Feature icons)
```

### Style
- **Library**: Material Icons (rounded variant preferred)
- **Weight**: 400 (regular)
- **Color**: Icon color from theme (secondary text color)
- **Interactive Icons**: Tertiary → Primary on hover/press

---

## Screen Patterns

### Home/Chat Screen
- Full-screen input area
- Centered branding/logo when empty
- Input fixed to bottom
- No traditional navigation bar
- Top bar with avatar + discovery icon

### Threads/History Screen
- Top bar with back navigation
- Search bar below header
- Scrollable list of thread items
- Timestamp and preview for each thread
- More menu per item

### Discovery/News Feed
- Top bar with search and favorite
- Horizontal category tabs
- Vertical scrolling card list
- Full-width image cards
- Article metadata and actions

### Settings Screen
- Grouped list sections
- Toggle switches for binary options
- Navigation arrows for sub-screens
- Profile header with avatar
- Pro badge/subscription status

### Auth/Login Modal
- Centered logo and branding
- Tab switcher (Login/Signup)
- Form fields with icons
- Primary action button
- Social login buttons
- Legal text at bottom
- Close button top-right

---

## Accessibility

1. **Contrast Ratios**: Minimum 4.5:1 for text, 3:1 for large text
2. **Touch Targets**: Minimum 44x44pt
3. **Text Scaling**: Support dynamic type
4. **Focus Indicators**: Clear cyan border for keyboard navigation
5. **Semantic Labels**: All interactive elements labeled
6. **Motion**: Respect reduced motion preferences

---

## Dark Mode Specifics

### Key Principles
1. **Pure Black Base** (#0A0A0A) for OLED optimization
2. **Subtle Elevation** through lightness, not shadows
3. **Reduced Color Saturation** for comfort
4. **Cyan Glows** for focus and emphasis
5. **Border-First** approach instead of heavy shadows

### Surface Hierarchy (Dark)
```
Level 0 (Base): #0A0A0A
Level 1 (Elevated): #141414
Level 2 (Card): #1A1A1A
Level 3 (Hover): #202020
```

---

## Implementation Notes

1. **Use DesignSystem class** for all tokens
2. **Theme-aware widgets** check `Theme.of(context).brightness`
3. **Const constructors** where possible for performance
4. **AnimatedContainer** for smooth transitions
5. **Material InkWell** for ripple effects
6. **Haptic feedback** on important interactions
7. **Gradient backgrounds** for primary CTAs only

---

## Brand-Specific Elements

### Insider Pro Badge
- Background: Cyan gradient
- Text: "pro" in lowercase
- Border Radius: 6px
- Padding: 4px 8px
- Font: Body Small, Semibold
- Position: Next to "insider" logo

### Logo Presentation
- Wordmark: "insider" in lowercase
- Font: Display style, Bold
- Size: 42px on main screen
- Color: Primary text color
- Pro variant: "insider pro" with gradient badge on "pro"

---

## Best Practices

### DO
✅ Use design system tokens exclusively
✅ Maintain consistent spacing rhythm
✅ Apply subtle animations to all interactions
✅ Use cyan gradient for primary actions only
✅ Implement theme switching without restart
✅ Test both dark and light modes
✅ Use semantic color names

### DON'T
❌ Hardcode colors or dimensions
❌ Mix different radius values in same component
❌ Use heavy drop shadows in dark mode
❌ Overuse gradients
❌ Skip animation/transition states
❌ Use inconsistent icon styles
❌ Create new spacing values arbitrarily

---

## Future Considerations

1. **Glassmorphism** - Potential blur effects for overlays
2. **Neumorphism** - Subtle depth for certain cards (light mode)
3. **Micro-interactions** - Advanced gesture-based interactions
4. **Custom Illustrations** - Brand-specific visual elements
5. **Adaptive Layouts** - Tablet and foldable support
6. **Seasonal Themes** - Special color schemes for events

---

## Change Log

### V2.0.0 (November 2025)
- Initial Perplexity-inspired design system
- Comprehensive color and typography scales
- Component specifications
- Dark-first approach
- Cyan gradient accent system

---

*This is a living document. Update as the design system evolves.*




