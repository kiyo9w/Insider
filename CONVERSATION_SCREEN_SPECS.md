# Conversation Screen Specifications
## Pixel-Perfect Perplexity Clone

*Last Updated: November 17, 2025*

---

## Overview

This document details the exact specifications for the conversation/chat screen, which displays AI responses with streaming text, search indicators, sources, and related questions. Every measurement, color, and spacing has been carefully calibrated to match the Perplexity reference images.

---

## Layout Structure

```
┌─────────────────────────────────────┐
│ [←]              [⋯ ⊙ ⋯]            │ ← Top Bar
├─────────────────────────────────────┤
│                                     │
│ context:                            │ ← Context Header
│ ······                              │ ← Dotted Separator
│                                     │
│ [User Query Text]                   │ ← User Question
│                                     │
│ ### 1 **Section Title...**          │ ← Collapsible Section
│           ∨                         │
│                                     │
│ [✨ Insider pro]                    │ ← Badge
│                                     │
│ SEARCHING                           │ ← Status Indicator
│ [🔍 search query pill]              │
│ [🔍 search query pill]              │
│                                     │
│ READING 20                          │ ← Reading Indicator
│                                     │
│ [Response text with **bold**        │ ← Streaming Response
│  and *italic* markdown...]          │
│                                     │
│ [π 11 Sources]                      │ ← Sources Button
│                                     │
│ [↪ Related question 1]              │ ← Related Questions
│ [↪ Related question 2]              │
│                                     │
├─────────────────────────────────────┤
│ Ask a follow up... [🎤]  [✏️]      │ ← Bottom Input
└─────────────────────────────────────┘
```

---

## Component Specifications

### 1. Context Section

#### "context:" Label
- **Font Size**: 16px
- **Font Weight**: 400 (Regular)
- **Line Height**: 1.5
- **Color**: 
  - Dark: `#FFFFFF` (textPrimaryDark)
  - Light: `#0A0A0A` (textPrimaryLight)
- **Padding**: 
  - Top: 16px
  - Horizontal: 24px
  - Bottom: 0px

#### Dotted Separator ("······")
- **Font Size**: 16px
- **Letter Spacing**: 3px
- **Line Height**: 1
- **Color**: 
  - Dark: `#6E6E6E` at 40% opacity
  - Light: `#999999` at 40% opacity
- **Spacing**: 8px below "context:", 16px above user query

#### User Query Text
- **Font Size**: 16px
- **Font Weight**: 400 (Regular)
- **Line Height**: 1.6
- **Letter Spacing**: 0
- **Color**: 
  - Dark: `#FFFFFF` (textPrimaryDark)
  - Light: `#0A0A0A` (textPrimaryLight)

---

### 2. Collapsible Section Header

#### Section Header Text
- **Font Size**: 15px
- **Font Weight**: 
  - "### 1": 400 (Regular)
  - "**Text**": 600 (SemiBold)
- **Line Height**: 1.5
- **Color**: 
  - Dark: `#B4B4B4` (textSecondaryDark)
  - Light: `#6E6E6E` (textSecondaryLight)
- **Padding**: 
  - Horizontal: 24px
  - Vertical: 8px
  - Top margin: 4px

#### Chevron Icon
- **Size**: 22px
- **Color**: 
  - Dark: `#6E6E6E` at 60% opacity
  - Light: `#999999` at 60% opacity
- **Spacing**: 12px above chevron

---

### 3. "Insider pro" Badge

#### Container
- **Padding**: 8px horizontal, 3px vertical
- **Border Radius**: 10px
- **Background**: Linear gradient
  - Start: `#20A4F3` (primaryCyan)
  - End: `#4CB8FF` (primaryCyanLight)
- **Margin**: 
  - Top: 16px
  - Horizontal: 24px
  - Bottom: 12px

#### Icon (Sparkle)
- **Icon**: `Icons.auto_awesome`
- **Size**: 12px
- **Color**: `#FFFFFF` (white)
- **Spacing**: 5px to right of icon

#### Text
- **Content**: "Insider pro"
- **Font Size**: 12px
- **Font Weight**: 600 (SemiBold)
- **Line Height**: 1.3
- **Letter Spacing**: 0
- **Color**: `#FFFFFF` (white)

---

### 4. Response Text (Markdown)

#### Container
- **Padding**: 
  - Horizontal: 24px
  - Top: 0px
  - Bottom: 12px

#### Text Style
- **Font Size**: 16px
- **Font Weight**: 400 (Regular)
- **Line Height**: 1.6
- **Letter Spacing**: 0
- **Color**: 
  - Dark: `#FFFFFF` (textPrimaryDark)
  - Light: `#0A0A0A` (textPrimaryLight)

#### Markdown Formatting
- **Bold (`**text**`)**: Font Weight 600
- **Italic (`*text*`)**: Font Style Italic
- **Streaming Speed**: 3ms per character

---

### 5. SEARCHING Indicator

#### Label
- **Text**: "SEARCHING"
- **Font Size**: 11px
- **Font Weight**: 600 (SemiBold)
- **Letter Spacing**: 0.8px
- **Line Height**: 1.2
- **Color**: 
  - Dark: `#6E6E6E` (textTertiaryDark)
  - Light: `#999999` (textTertiaryLight)
- **Padding**: 
  - Horizontal: 24px
  - Vertical: 12px

#### Search Query Pills
- **Margin**: 6px bottom between pills
- **Padding**: 10px horizontal, 8px vertical
- **Border Radius**: 6px
- **Background**: 
  - Dark: `#141414` (backgroundDarkElevated)
  - Light: `#F8F9FA` (backgroundLightElevated)
- **Border**: 0.5px solid
  - Dark: `#2A2A2A` at 30% opacity
  - Light: `#E5E5E5` at 30% opacity

##### Search Icon
- **Icon**: `Icons.search`
- **Size**: 15px
- **Color**: 
  - Dark: `#B4B4B4` (textSecondaryDark)
  - Light: `#6E6E6E` (textSecondaryLight)
- **Spacing**: 8px to right

##### Query Text
- **Font Size**: 13px
- **Font Weight**: 400 (Regular)
- **Line Height**: 1.4
- **Color**: 
  - Dark: `#B4B4B4` (textSecondaryDark)
  - Light: `#6E6E6E` (textSecondaryLight)

---

### 6. READING Indicator

#### Container
- **Padding**: 
  - Horizontal: 24px
  - Vertical: 8px

#### "READING" Label
- **Font Size**: 11px
- **Font Weight**: 600 (SemiBold)
- **Letter Spacing**: 0.8px
- **Line Height**: 1.2
- **Color**: 
  - Dark: `#6E6E6E` (textTertiaryDark)
  - Light: `#999999` (textTertiaryLight)

#### Count Number
- **Font Size**: 11px
- **Font Weight**: 600 (SemiBold)
- **Line Height**: 1.2
- **Color**: Same as label
- **Spacing**: 8px left of label

---

### 7. Sources Button

#### Container
- **Padding**: 12px horizontal, 6px vertical
- **Border Radius**: 14px
- **Background**: 
  - Dark: `#141414` (backgroundDarkElevated)
  - Light: `#F8F9FA` (backgroundLightElevated)
- **Border**: 0.5px solid
  - Dark: `#2A2A2A` at 50% opacity
  - Light: `#E5E5E5` at 50% opacity
- **Margin**: 
  - Horizontal: 24px
  - Top: 8px
  - Bottom: 12px
- **Interactive**: Tappable with haptic feedback

#### Pi Symbol
- **Content**: "π"
- **Font Size**: 13px
- **Color**: 
  - Dark: `#B4B4B4` (textSecondaryDark)
  - Light: `#6E6E6E` (textSecondaryLight)
- **Spacing**: 6px to right

#### "X Sources" Text
- **Font Size**: 14px
- **Font Weight**: 500 (Medium)
- **Line Height**: 1.4
- **Color**: 
  - Dark: `#FFFFFF` (textPrimaryDark)
  - Light: `#0A0A0A` (textPrimaryLight)

---

### 8. Related Questions

#### Container
- **Padding**: 
  - Horizontal: 24px
  - Top: 12px
  - Bottom: 16px

#### Individual Question Card
- **Margin**: 10px bottom between cards
- **Padding**: 14px horizontal, 12px vertical
- **Border Radius**: 10px
- **Background**: 
  - Dark: `#141414` (backgroundDarkElevated)
  - Light: `#F8F9FA` (backgroundLightElevated)
- **Border**: 0.5px solid
  - Dark: `#2A2A2A` at 60% opacity
  - Light: `#E5E5E5` at 60% opacity
- **Interactive**: Tappable with haptic feedback

##### Arrow Icon
- **Icon**: `Icons.subdirectory_arrow_right`
- **Size**: 17px
- **Color**: 
  - Dark: `#B4B4B4` (textSecondaryDark)
  - Light: `#6E6E6E` (textSecondaryLight)
- **Spacing**: 10px to right

##### Question Text
- **Font Size**: 14px
- **Font Weight**: 400 (Regular)
- **Line Height**: 1.45
- **Color**: 
  - Dark: `#FFFFFF` (textPrimaryDark)
  - Light: `#0A0A0A` (textPrimaryLight)

---

### 9. Bottom Input Area

#### Container
- **Padding**: 16px horizontal, 12px vertical
- **Background**: 
  - Dark: `#0A0A0A` (backgroundDark)
  - Light: `#FFFFFF` (backgroundLight)
- **Border**: 0.5px solid top border
  - Dark: `#2A2A2A` (borderDark)
  - Light: `#E5E5E5` (borderLight)

#### Text Input Field
- **Height**: 44px minimum
- **Border Radius**: 24px (pill shape)
- **Background**: 
  - Dark: `#141414` (backgroundDarkElevated)
  - Light: `#F8F9FA` (backgroundLightElevated)
- **Padding**: 16px horizontal
- **Placeholder**: "Ask a follow up..."
  - Font Size: 15px
  - Color: 
    - Dark: `#6E6E6E` (textTertiaryDark)
    - Light: `#999999` (textTertiaryLight)

#### Microphone Icon
- **Icon**: `Icons.mic_none`
- **Size**: 22px
- **Color**: 
  - Dark: `#B4B4B4` (textSecondaryDark)
  - Light: `#6E6E6E` (textSecondaryLight)
- **Position**: Right side of input, inside container

#### Edit Button (Separate)
- **Size**: 44px × 44px
- **Shape**: Circle
- **Background**: 
  - Dark: `#141414` (backgroundDarkElevated)
  - Light: `#F8F9FA` (backgroundLightElevated)
- **Icon**: `Icons.edit_outlined`
- **Icon Size**: 20px
- **Spacing**: 12px left of input field

---

### 10. Scroll-Down Button

#### Container
- **Size**: 44px × 44px
- **Shape**: Circle
- **Background**: 
  - Dark: `#141414` (backgroundDarkElevated)
  - Light: `#F8F9FA` (backgroundLightElevated)
- **Position**: 
  - Right: 16px from edge
  - Bottom: 100px from bottom
- **Visibility**: Appears when scrolled >200px

#### Icon
- **Icon**: `Icons.keyboard_arrow_down`
- **Size**: 24px
- **Color**: 
  - Dark: `#B4B4B4` (iconDark)
  - Light: `#6E6E6E` (iconLight)

---

## Spacing Rhythm

### Horizontal Padding
- **Standard**: 24px (consistent throughout)

### Vertical Spacing
- **Context to Separator**: 8px
- **Separator to Query**: 16px
- **Section to Badge**: 16px
- **Badge to Response**: 12px
- **Response to Sources**: 8px
- **Sources to Questions**: 12px
- **Between Related Questions**: 10px
- **Between Search Pills**: 6px

---

## Color Palette (Dark Mode Primary)

```dart
Background Base:      #0A0A0A
Background Elevated:  #141414
Border:               #2A2A2A
Text Primary:         #FFFFFF
Text Secondary:       #B4B4B4
Text Tertiary:        #6E6E6E
Primary Cyan:         #20A4F3
Primary Cyan Light:   #4CB8FF
```

---

## Interactions

### Haptic Feedback
- Collapsible section tap
- Sources button tap
- Related question tap
- All tappable elements provide `HapticFeedback.lightImpact()`

### Animations
- Text streaming: 3ms per character
- Scroll animation: 200ms `Curves.easeOut`
- Search pills: Fade in when SEARCHING state active
- Reading indicator: Fade in/out transitions

---

## Implementation Notes

1. **Consistent 24px horizontal padding** throughout all sections
2. **Font size 16px for body text** to match reference exactly
3. **Line height 1.6** for comfortable reading
4. **Subtle borders (0.5px)** with transparency for depth
5. **Border radius harmony**: 6-14px range for visual consistency
6. **Typography weights**: 400 (regular), 500 (medium), 600 (semibold)
7. **Letter spacing for labels**: 0.8px for uppercase indicators

---

## Visual Hierarchy

1. **Primary Content**: User query and AI response (16px, white)
2. **Secondary Elements**: Section headers, sources (14-15px, #B4B4B4)
3. **Tertiary Elements**: Status indicators, timestamps (11-13px, #6E6E6E)
4. **Interactive Elements**: Cyan gradient for badge, subtle borders for cards

---

*This specification ensures pixel-perfect recreation of the Perplexity conversation interface.*


