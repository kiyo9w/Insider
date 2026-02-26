<!--
╔══════════════════════════════════════════════════════════════════════════════╗
║  ⛔  DO NOT IMPLEMENT YET — PLANNING ARTIFACT ONLY                          ║
║  This document is a planning artifact. No code, file, or configuration      ║
║  may be modified based on this plan until this gate line is explicitly       ║
║  removed or superseded by written approval from the product owner / tech     ║
║  lead. Analysis and curl verification may proceed; implementation may not.  ║
╚══════════════════════════════════════════════════════════════════════════════╝
-->

# REVISION_PLAN.md — iOS App Store Guideline 2.1 App Completeness

**Repo:** `/home/node/.openclaw/workspace/Insider`  
**Backend:** `https://api.trinq.site` (production), `https://api-dev.trinq.site` (staging)  
**Date:** 2026-02-25  
**Author:** BMAD Architect+Developer (subagent planning session)  
**Objective:** Eliminate all reviewer-visible functional breakage before iOS App Store submission.

---

## Executive Summary of Findings

Backend is live and correctly authenticated via **session cookie** (`sessionid`). The cookie injection strategy in the app is correct. Six confirmed defects were found, ranked by reviewer visibility:

| # | Issue | Severity | Root Cause |
|---|-------|----------|-----------|
| 1 | **Registration always fails** | 🔴 Critical | App omits required `name` field; AND response model mismatch throws on parse |
| 2 | **SSO button is dead / unsupported text** | 🔴 Critical | `onTap: (){}` — no handler; text misleads reviewer |
| 3 | **Privacy Policy / Terms links do nothing** | 🔴 Critical | `onTap: () {}` in both `AuthScreen` and `AuthBottomSheet`; no URL launch |
| 4 | **Profile avatar not shown after upload** | 🟠 High | `image_url` is null from server; `image` (relative) correctly stored but AuthCubit user never updated from profile upload response |
| 5 | **Push Notifications toggle is fake** | 🟠 High | Hardcoded `value: true`, `onChanged` does nothing |
| 6 | **Attachment buttons dead (chat)** | 🟡 Medium | `onTap: (){}` on Image / Camera / File in conversation attachment sheet |

Additional issues (polish / App Store risk):
- `"home": "Trang chủ"` (Vietnamese text) in English locale file `intl_en.arb`
- `"didnt_supported": "Floor didnt support"` — typoed internal string leaks to UI
- Forgot-Password submit button shows fake success (no API call, no `/api/v1/auth/forgot-password` endpoint exists)
- Hardcoded version string `'Insider v2.251030.0 • Build 17068'` in `setting_page.dart`
- Demo routes (`/dogImageRandom`, `/assets`, `/imagesFromDb`) accessible in production build
- `HomePage` shown as `home` route but contains boilerplate ("Dog image random") buttons

---

## 1. Backend Verification Evidence

### Auth Endpoints Tested (2026-02-25)

```bash
# CSRF token
GET https://api.trinq.site/api/v1/auth/csrf-token
# Returns: {"csrfToken":"<token>", "message":"..."} + sets `csrftoken_signed` cookie
# ✅ Works

# Login (cookie-based session)
POST /api/v1/auth/login  body: {"email":"admin@insider.com","password":"insider-admin-1234@"}
# Returns: {"user":{...},"session":{"token":"<uuid>","expires_at":"...",...}}
# Server sets: Set-Cookie: sessionid=<uuid>; HttpOnly
# ✅ Works — session token IS the cookie value

# /auth/me — authenticated endpoint (requires sessionid cookie)
GET /api/v1/auth/me   Header: Cookie: sessionid=<token>
# Returns: {"name":"Admin","email":"admin@insider.com","image":null,"image_url":null,...}
# ✅ Works with Cookie header injection; ❌ FAILS with Authorization: Bearer <token>

# Profile
GET /api/v1/profile/me   Cookie: sessionid=<token>
# Returns: {"id":..., "image":"avatars/<user_id>/avatar.png", "image_url":null, ...}
# ✅ Works

# Avatar upload
POST /api/v1/profile/avatar   multipart/form-data: file=<image>
# Returns ProfileResponse with image="avatars/<uuid>/avatar.png", image_url=null
# ⚠️ image_url remains null — only image (relative path) is populated

# Registration — BROKEN
POST /api/v1/auth/register   body: {"email":"...","password":"..."}
# Returns: 422 {"details":[{"type":"missing","loc":["body","name"],...}]}
# ❌ Missing required `name` field not sent by app

# Registration — server response shape mismatch
# Server returns: {"user":{...}, "message":"..."}  (HTTP 201)
# App model RegisterResponse expects: {"success":bool, "message":"...", "data":{"email":"...","expires_in":int}}
# ❌ JSON parse throws — registration can NEVER succeed even if name were sent
```

### Cookie Injection Verification

```bash
curl https://api.trinq.site/api/v1/auth/me -H "Cookie: sessionid=<valid_token>"
# HTTP 200 — confirms DioModule interceptor cookie injection approach is correct
```

---

## 2. Defect Detail & Fix Specifications

### [BUG-01] Registration Broken — Dual Root Cause

**Files:**
- `packages/rest_client/lib/src/models/auth/auth_models.dart` — `RegisterRequest`, `RegisterResponse`
- `lib/features/auth/view/register_screen.dart` — `_RegisterScreenState`
- `lib/features/auth/cubit/auth_cubit.dart` — `register()`

**Root Cause A — Missing `name` field:**
- `RegisterRequest` model only has `email` + `password`
- Server schema `RegisterRequest` requires `name`, `email`, `password` (all required)
- Fix: Add `name` field to `RegisterRequest` model; add Name text field to `RegisterScreen`

**Root Cause B — Response model mismatch:**
- `RegisterResponse` in app: `{success: bool, message: String, data: RegisterData{email, expires_in}}`
- Server `RegisterResponse`: `{user: UserResponse, message: String}` (no `success`, no `data`)
- `RegisterData.fromJson` call will throw `MissingRequiredKeysException` → caught by cubit → displayed as error snackbar
- Fix: Update `RegisterResponse` + `RegisterData` models to match server shape

**Hypothesis for why login works:** Login response shape matches — `{user: UserData, session: SessionData}` aligns with app's `LoginResponse` model.

**Acceptance Criteria:**
- [ ] New user can complete registration form (name + email + password + confirm)
- [ ] Server returns HTTP 201 and auto-login succeeds
- [ ] User lands on main chat screen authenticated

**Verification Commands:**
```bash
# After fix: test registration with name field
curl -X POST https://api.trinq.site/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -H "X-CSRF-Token: $CSRF" -b /tmp/csrf_cookies.txt \
  -d '{"name":"Test User","email":"test@example.com","password":"TestPass123!"}' \
  -w "\nHTTP:%{http_code}"
# Expect: HTTP 201 + {"user":{...}, "message":"Registration successful..."}
```

---

### [BUG-02] SSO Button — Dead + Unsupported Text

**Files:**
- `lib/features/auth/view/auth_screen.dart` — `_buildSSOButton()` and `_buildFooter()`
- `lib/features/auth/view/auth_bottom_sheet.dart` — SSO text + Privacy/Terms links

**Evidence:**
```dart
// auth_screen.dart line 198 (SSO button)
onTap: () {
  HapticFeedback.lightImpact();  // Does nothing else
},

// auth_bottom_sheet.dart — SSO rendered as plain Text widget, no GestureDetector at all
Text('Single sign-on (SSO)', style: ...)
```

**Risk:** Apple reviewer will tap "Single sign-on (SSO)" and expect something to happen. Guideline 2.1 explicitly flags unimplemented features.

**Fix Options:**
1. Remove the SSO text entirely from both `auth_screen.dart` and `auth_bottom_sheet.dart` **(recommended)**
2. Replace with a coming-soon modal (acceptable but not ideal)

**Acceptance Criteria:**
- [ ] No SSO text visible on auth screens OR tap shows a clear "coming soon" message
- [ ] No tappable element that silently does nothing

---

### [BUG-03] Privacy Policy / Terms Links Do Nothing

**Files:**
- `lib/features/auth/view/auth_screen.dart` — `_buildFooter()` (lines 198, 211)
- `lib/features/auth/view/auth_bottom_sheet.dart` — Row with Privacy/Terms plain Text widgets

**Evidence:**
```dart
// auth_screen.dart _FooterLink widgets
_FooterLink(text: 'Privacy policy', isDark: isDark, onTap: () {}),  // line 198
_FooterLink(text: 'Terms of service', isDark: isDark, onTap: () {}),  // line 211

// auth_bottom_sheet.dart — no GestureDetector at all on these text items
Text('Privacy policy', style: ...)
Text('Terms of service', style: ...)
```

**Required Target URL:** `http://chimai.io` (specified by requester)

**Fix:** Use `url_launcher` package (already a common Flutter dependency) to open `http://chimai.io`. Both Privacy Policy and Terms of Service should open the same base URL or appropriate subpaths if they exist. Check `pubspec.yaml` for `url_launcher`.

**Verification:**
```bash
grep "url_launcher" /home/node/.openclaw/workspace/Insider/pubspec.yaml
```

**Acceptance Criteria:**
- [ ] Tapping "Privacy policy" opens `http://chimai.io` in system browser
- [ ] Tapping "Terms of service" opens `http://chimai.io` (or `/terms`) in system browser
- [ ] Links work from BOTH `auth_screen.dart` and `auth_bottom_sheet.dart`
- [ ] iOS privacy permission not needed (external URL opens via Safari)

---

### [BUG-04] Profile Avatar Not Shown After Upload

**Files:**
- `lib/features/setting/account_screen.dart` — `_buildAvatar()`, `displayImage` logic
- `lib/features/setting/setting_page.dart` — `_buildProfileSection()` using `user?.image`
- `packages/rest_client/lib/src/models/profile/profile_models.dart` — `ProfileData.imageUrl`

**Root Cause (Multi-layer):**

**Layer A — Backend returns null `image_url`:**
```json
// After POST /api/v1/profile/avatar:
{"image": "avatars/<uuid>/avatar.png", "image_url": null, ...}
```
`image_url` is never populated by the server. Only `image` (relative path) is set.

**Layer B — `AccountScreen` prefers `imageUrl` over `image`:**
```dart
final displayImage = profile?.imageUrl ?? authUser?.image;
// imageUrl = null → falls back to authUser?.image
// authUser?.image = null (UserData.image from /auth/me, which returns null image for most users)
// → displayImage = null → shows placeholder icon
```

**Layer C — `SettingPage` reads `UserData.image` not `ProfileData.image`:**
```dart
user?.image  // from AuthCubit/UserData — populated from /auth/me (returns null after avatar upload)
// AuthCubit is NOT updated when ProfileCubit uploads avatar
// → Settings page NEVER shows the uploaded avatar
```

**Layer D — `image_url` may be populated via storage endpoint but bucket path doesn't match:**
```bash
curl https://api.trinq.site/api/v1/storage/files/avatars/<uuid>/avatar.png  → 404
```

**Fix Strategy:**
1. In `AccountScreen.displayImage`: use `profile?.image` as second fallback if `imageUrl` is null:  
   `final displayImage = profile?.imageUrl ?? (profile?.image?.isNotEmpty == true ? '${AppConfig.baseUrl}/${profile!.image}' : null) ?? authUser?.image;`
2. After `ProfileCubit.uploadAvatar()` succeeds, emit an event / notify `AuthCubit` to refresh user from `/auth/me` so `SettingPage` also updates. OR: `SettingPage` should read from `ProfileCubit` if available, falling back to `AuthCubit`.
3. Consider: add a `GET /api/v1/profile/me` call in `AuthCubit.checkAuthStatus()` to seed image into UserData.

**Acceptance Criteria:**
- [ ] Upload avatar → avatar visible immediately in `AccountScreen`
- [ ] Navigate to Settings → avatar visible in profile row
- [ ] App restart → avatar still visible (persisted)
- [ ] `errorBuilder` gracefully shows placeholder icon on network failure

---

### [BUG-05] Push Notifications Toggle is Non-functional

**Files:**
- `lib/features/setting/setting_page.dart` — `_buildNotificationToggle()` (line 243–258)

**Evidence:**
```dart
Switch.adaptive(
  value: true,  // Hardcoded true
  onChanged: (value) {
    HapticFeedback.lightImpact();  // Does nothing else
  },
  ...
)
```

**Risk:** A reviewer toggling notifications off (or on) and getting no response is a 2.1 failure.

**Fix:** Either:
1. Implement real permission check + `NotificationService` registration/deregistration
2. Remove the toggle and add a button to "Open Notification Settings" (deep link to iOS Settings)
3. Show a "Feature coming soon" modal (least preferred but acceptable)

**Acceptance Criteria:**
- [ ] Toggle reflects actual notification permission state
- [ ] Toggling ON requests iOS permission if not granted
- [ ] Toggling OFF unregisters push token from server OR opens Settings

---

### [BUG-06] Attachment Buttons Dead in Chat Screen

**Files:**
- `lib/features/chat/view/conversation_screen.dart` — lines 1038, 1044, 1050 (Image/Camera/File)
- `lib/features/chat/view/conversation_history_screen.dart` — lines 1106, 1112, 1118

**Evidence:**
```dart
_buildAttachmentOption(icon: Icons.image_outlined, label: 'Image', onTap: () {}),
_buildAttachmentOption(icon: Icons.camera_alt_outlined, label: 'Camera', onTap: () {}),
_buildAttachmentOption(icon: Icons.description_outlined, label: 'File', onTap: () {}),
```

**Risk:** Medium — reviewer will tap the attachment (paperclip) icon, see Image/Camera/File options, and tap them to get no result.

**Fix Options:**
1. Implement file picking (uses `ImagePicker` already in the project via `account_screen.dart`)
2. Remove the attachment sheet entirely if file uploads are not supported
3. Show `SnackBar` with `S.current.feature_coming_soon('File upload')` — passable for review

**Note:** The `SourcesButton` in `assistant_message.dart` also has `onTap: () {}` but this likely refers to the sources panel — verify if `SourcesBottomSheet` is properly hooked up.

---

### [BUG-07] Forgot Password Button Fake Success

**Files:**
- `lib/features/auth/view/email_signin_screen.dart` — `_showForgotPasswordSheet()` ~line 427

**Evidence:**
```dart
onPressed: () {
  HapticFeedback.mediumImpact();
  Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(S.current.reset_link_sent), ...),
  );
  // NO API CALL
},
```

**Confirmed:** `/api/v1/auth/reset-password` exists but requires `{email, reset_token, new_password, confirm_password}` — it's a token-redemption endpoint, not an email-sending endpoint. No `/forgot-password` or `/send-reset-link` endpoint exists in the OpenAPI spec.

**Risk:** Reviewer enters email, taps Send, sees success message, but gets no email. Medium-high risk.

**Fix Options:**
1. Remove the "Forgot password?" link entirely
2. Show a non-fake message: "Please contact support to reset your password" 
3. Implement the API once backend adds a send-reset-link endpoint

**Acceptance Criteria:**
- [ ] Pressing "Send reset link" either calls a real API or clearly states that action is manual/support-based

---

## 3. Lower Priority / Polish Issues

### [POLISH-01] English Locale Has Vietnamese Text

**File:** `lib/l10n/intl_en.arb`

```json
"home": "Trang chủ"  // Should be "Home"
"didnt_supported": "Floor didnt support"  // Typo + internal boilerplate
```

These strings may not be reviewer-visible in the current `AppDirector` flow (which skips `HomePage`), but they're risk vectors if routes change.

### [POLISH-02] Hardcoded Version String

**File:** `lib/features/setting/setting_page.dart` line 494:
```dart
'Insider v2.251030.0 • Build 17068'
```
Should use `package_info_plus` to read `PackageInfo.version` + `PackageInfo.buildNumber`.

### [POLISH-03] Demo Routes Accessible in Production

**File:** `lib/router/app_router.dart`
Routes `/dogImageRandom`, `/assets`, `/imagesFromDb` are registered unconditionally. They import demo/test widgets (`DogImageRandomPage`, `AssetsPage`, `ImagesFromDbPage`). These should be gated behind `kDebugMode`.

### [POLISH-04] `SourcesButton` Dead Tap in Chat

**File:** `lib/features/chat/view/widgets/assistant_message.dart` line 111:
```dart
SourcesButton(..., onTap: () {})
```
The `SourcesBottomSheet` widget exists — `onTap` should open it.

### [POLISH-05] Settings Push Notification Toggle Data Loss

After app restart, the notification toggle always shows `true` regardless of actual permission state.

---

## 4. Backend Verification Plan (Regression Testing)

Run this sequence before every release build:

```bash
#!/bin/bash
BASE="https://api.trinq.site"

# Step 1: Get CSRF
CSRF_JSON=$(curl -sc /tmp/rc_csrf.txt "$BASE/api/v1/auth/csrf-token")
CSRF=$(echo $CSRF_JSON | python3 -c "import sys,json; print(json.load(sys.stdin)['csrfToken'])")
echo "[PASS] CSRF: $CSRF"

# Step 2: Login
LOGIN=$(curl -sc /tmp/rc_sess.txt -s -X POST "$BASE/api/v1/auth/login" \
  -H "Content-Type: application/json" -H "X-CSRF-Token: $CSRF" \
  -b /tmp/rc_csrf.txt \
  -d '{"email":"admin@insider.com","password":"insider-admin-1234@"}')
TOKEN=$(echo $LOGIN | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['session']['token'])")
echo "[PASS] Session token: $TOKEN"

# Step 3: Auth check
ME=$(curl -s "$BASE/api/v1/auth/me" -H "Cookie: sessionid=$TOKEN")
echo $ME | python3 -c "import sys,json; d=json.load(sys.stdin); assert d['email']=='admin@insider.com', 'me() fail'"
echo "[PASS] /auth/me authenticated"

# Step 4: Profile
PROF=$(curl -s "$BASE/api/v1/profile/me" -H "Cookie: sessionid=$TOKEN")
echo $PROF | python3 -c "import sys,json; d=json.load(sys.stdin); assert 'id' in d, 'profile fail'"
echo "[PASS] /profile/me OK"

# Step 5: Registration (AFTER BUG-01 fix)
CSRF2=$(curl -sc /tmp/rc_csrf2.txt "$BASE/api/v1/auth/csrf-token" | python3 -c "import sys,json; print(json.load(sys.stdin)['csrfToken'])")
TS=$(date +%s)
REG=$(curl -s -X POST "$BASE/api/v1/auth/register" \
  -H "Content-Type: application/json" -H "X-CSRF-Token: $CSRF2" \
  -b /tmp/rc_csrf2.txt \
  -d "{\"name\":\"Test $TS\",\"email\":\"test_$TS@example.com\",\"password\":\"TestPass123!\"}")
echo $REG | python3 -c "import sys,json; d=json.load(sys.stdin); assert 'user' in d, f'register fail: {d}'"
echo "[PASS] Registration with name OK"

echo "All backend checks passed."
```

---

## 5. Risk Matrix

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| Registration still broken after fix | Low | Critical rejection | Integration test with real API after code change |
| Apple reviewer tests SSO tap | High | Rejection (2.1) | Remove SSO text/button entirely |
| Apple reviewer taps Privacy Policy | High | Rejection (2.1) | Add url_launcher to chimai.io |
| Avatar not shown → reviewer thinks profile broken | Medium | Rejection (2.1) | Fix image fallback + AuthCubit refresh |
| Notification toggle fake → reviewer tests it | Medium | Rejection (2.1) | Implement or deep-link to Settings |
| Attachment buttons dead → reviewer tests chat | Medium | Rejection (2.1) | Remove or show coming-soon |
| Forgot-password fake success | Medium | Rejection | Remove or show support message |
| Staging vs production config mismatch | Low | Auth failures | Verify `AppConfig.useStaging = false` |

---

## 6. Execution Slices (Ordered)

### Slice 1 — Auth Fixes (Critical, ~3h)
1. **Fix `RegisterRequest` model:** Add `name: String` to `packages/rest_client/lib/src/models/auth/auth_models.dart`
2. **Fix `RegisterResponse` model:** Change to `{user: UserData, message: String}`; remove `RegisterData.success` and `RegisterData.data`
3. **Regenerate `.g.dart` files:** Run `dart run build_runner build --delete-conflicting-outputs` in `packages/rest_client/`
4. **Add Name field to `register_screen.dart`:** New `TextEditingController _nameController`, new input widget, pass `name` to `AuthCubit.register()`
5. **Update `AuthCubit.register()`:** Pass `name: name` to `RegisterRequest`
6. **Remove SSO button text** from `auth_screen.dart` (`_buildSSOButton`) and `auth_bottom_sheet.dart`

### Slice 2 — Links & URLs (~1h)
7. **Verify `url_launcher` in `pubspec.yaml`**; add if missing
8. **Fix Privacy Policy + Terms links** in `auth_screen.dart` `_buildFooter()`: replace `onTap: () {}` with `launchUrl(Uri.parse('http://chimai.io'))`
9. **Fix `auth_bottom_sheet.dart`** footer: wrap both text items in `GestureDetector` with same URL
10. **Add iOS `Info.plist` LSApplicationQueriesSchemes** entry if needed for `http://` links

### Slice 3 — Profile Avatar (~2h)
11. **Fix `AccountScreen.displayImage` fallback:** prefer `profile?.image` (relative) over `authUser?.image`; construct absolute URL with `AppConfig.baseUrl`
12. **After `ProfileCubit.uploadAvatar()` success:** call `authCubit.checkAuthStatus()` or refresh `AuthCubit.state.user.image` to sync SettingPage avatar
13. **Fix `SettingPage` avatar:** read from `ProfileData` if loaded, with `AuthCubit` user as fallback

### Slice 4 — Notifications (~1.5h)
14. **Read actual permission state** using `permission_handler` or `firebase_messaging` `getNotificationSettings()`
15. **Wire `onChanged`** to request/revoke permissions or open iOS Settings via `openAppSettings()`

### Slice 5 — Dead Buttons (~1h)
16. **Attachment sheet**: remove Image/Camera/File options OR implement with `ImagePicker`/`FilePicker`
17. **Forgot password**: replace fake success with `Text('Contact support at support@chimai.io')`
18. **`SourcesButton` `onTap`**: open `SourcesBottomSheet`

### Slice 6 — Polish (~30min)
19. Fix `intl_en.arb`: `"home": "Home"`, `"didnt_supported": "Unsupported platform"`
20. Replace hardcoded version string with `package_info_plus` call
21. Gate demo routes behind `kDebugMode` check in router
22. Re-verify: check `AppConfig.useStaging = false` for production build

---

## 7. Pre-Submission Checklist

- [ ] Fresh install: open app, tap Settings → Auth screen loads, SSO text absent
- [ ] Registration: complete form (name+email+password) → success → lands on chat screen
- [ ] Login: enter valid credentials → authenticated
- [ ] Logout → re-login → still works
- [ ] Privacy Policy tap → browser opens chimai.io
- [ ] Terms of Service tap → browser opens chimai.io
- [ ] Account → upload avatar → avatar shows immediately
- [ ] Navigate back to Settings → avatar shows in header
- [ ] App restart → avatar still visible
- [ ] Notification toggle reflects real permission state; toggle actually changes it
- [ ] Chat: tap attachment icon → no dead buttons (either works or removed)
- [ ] Forgot Password → either calls API or shows honest support message
- [ ] No Vietnamese text in English mode
- [ ] Version string reads from `package_info_plus`, not hardcoded
- [ ] Production URL: `AppConfig.useStaging == false`

---

## Appendix A: File Change Index

| File | Change |
|------|--------|
| `packages/rest_client/lib/src/models/auth/auth_models.dart` | Add `name` to `RegisterRequest`; fix `RegisterResponse`/`RegisterData` shape |
| `packages/rest_client/lib/src/clients/auth/auth_client.g.dart` | Regenerate |
| `packages/rest_client/lib/src/models/auth/auth_models.g.dart` | Regenerate |
| `packages/rest_client/lib/src/models/auth/auth_models.freezed.dart` | Regenerate |
| `lib/features/auth/view/register_screen.dart` | Add Name field, pass to cubit |
| `lib/features/auth/cubit/auth_cubit.dart` | Pass `name` to `RegisterRequest` |
| `lib/features/auth/view/auth_screen.dart` | Remove SSO button; fix Privacy/Terms `onTap` |
| `lib/features/auth/view/auth_bottom_sheet.dart` | Remove SSO text; fix Privacy/Terms |
| `lib/features/setting/account_screen.dart` | Fix `displayImage` fallback; sync `AuthCubit` after avatar upload |
| `lib/features/setting/setting_page.dart` | Fix notification toggle; fix avatar from profile; use `package_info_plus` |
| `lib/features/chat/view/conversation_screen.dart` | Fix/remove dead attachment buttons |
| `lib/features/chat/view/conversation_history_screen.dart` | Same |
| `lib/features/chat/view/widgets/assistant_message.dart` | Wire `SourcesButton.onTap` |
| `lib/features/auth/view/email_signin_screen.dart` | Fix forgot-password fake success |
| `lib/l10n/intl_en.arb` | Fix "Trang chủ" → "Home", fix typo |
| `lib/generated/intl/messages_en.dart` | Regenerate |
| `lib/router/app_router.dart` | Gate demo routes behind `kDebugMode` |
| `ios/Runner/Info.plist` | Verify `NSCameraUsageDescription`, `NSPhotoLibraryUsageDescription` if file picking enabled |
| `pubspec.yaml` | Verify/add `url_launcher`, `package_info_plus` |
