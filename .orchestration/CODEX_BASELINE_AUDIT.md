## Architecture map
- Entry and boot chain: `lib/main.dart` -> `lib/bootstrap.dart` -> `lib/injector/injector.dart` (`DioModule`, `ServiceModule`, `RestClientModule`, `RepositoryModule`, `BlocModule`) -> `lib/features/app/view/app.dart`.
- Runtime state layer: app/auth/threads/chat state units in `lib/features/app/bloc/`, `lib/features/auth/cubit/`, `lib/features/threads/cubit/`, `lib/features/chat/cubit/`.
- Navigation shell: `lib/router/app_router.dart` (`GoRouter`) + `lib/features/app/view/app_director.dart` + `lib/features/main/view/main_shell.dart`.
- Data access: repositories in `lib/data/repositories/**` backed by generated clients in `packages/rest_client/lib/src/clients/**` via `lib/injector/modules/rest_client_module.dart`.
- Streaming chat path: UI in `lib/features/chat/view/conversation_screen.dart`; SSE transport/transform in `lib/data/repositories/chat/chat_repository_impl.dart`; source selection in `lib/features/chat/data/source_service.dart`.
- Cross-cutting services: storage `lib/services/local_storage_service/local_storage_secure_service.dart`, notifications `lib/services/notification_service/fcm_notification_service.dart`, crash logging `lib/services/crashlytics_service/**`, config `lib/configs/app_config.dart`.
- Local packages: DB in `packages/local_database/lib/src/**`, API models/clients in `packages/rest_client/lib/src/**`.

## Top 10 technical risks (ranked)
1. Missing local dependency breaks deterministic setup: `pubspec.yaml` references `packages/gpt_markdown` but directory is absent (`packages/`).
2. Web build break risk from `dart:io` imports in app codepaths: `lib/main.dart`, `lib/injector/modules/service_module.dart`, `lib/data/repositories/profile/profile_repository_impl.dart`.
3. Route ambiguity at root (`'/'` defined twice) can shadow pages/deeplinks: `lib/router/app_router.dart` (`appDirectorPath`, `homePath`).
4. Session model is inconsistent (cookie + bearer + duplicated access/refresh token semantics): `lib/injector/modules/dio_module.dart`, `lib/data/repositories/chat/chat_repository_impl.dart`, `lib/features/auth/cubit/auth_cubit.dart`.
5. Global logout side-effect on any 401/403 can cause false session wipes: `lib/injector/modules/dio_module.dart` (`onError` interceptor).
6. Chat SSE pipeline is complex and race-prone (timer queue, multi-close paths, delayed force-close): `lib/data/repositories/chat/chat_repository_impl.dart`.
7. Sensitive values logged in clear text (token/email/storage values): `lib/features/auth/cubit/auth_cubit.dart`, `lib/services/local_storage_service/local_storage_secure_service.dart`, `lib/injector/modules/dio_module.dart`.
8. Push registration is effectively disabled while still invoked in auth flows: `lib/services/notification_service/fcm_notification_service.dart`, `lib/features/auth/cubit/auth_cubit.dart`.
9. Source selector state is process-global singleton; chat/session coupling risk and stale selections: `lib/features/chat/data/source_service.dart`, `lib/features/chat/view/conversation_screen.dart`.
10. Architecture drift/dead scaffolding increases maintenance risk: empty auth service files `lib/services/auth_service/auth_service.dart`, `lib/services/auth_service/auth_service_impl.dart`; unused interceptor `lib/core/interceptors/csrf_header_interceptor.dart`.

## Missing test coverage
- No active unit coverage for auth lifecycle, storage/session side-effects, and error branches: `lib/features/auth/cubit/auth_cubit.dart` (none in `test/features/`).
- No tests for router invariants/deeplink contracts: `lib/router/app_router.dart` (only broad UI flow in `integration_test/cases/app_route_test.dart`).
- No deterministic tests for SSE transform/state machine (event matrix, done/cancel ordering): `lib/data/repositories/chat/chat_repository_impl.dart`.
- No tests for global interceptor auth-clear policy and cookie/header behavior: `lib/injector/modules/dio_module.dart`.
- No tests for source selection merge/reset behavior and remote resource fetch fallback: `lib/features/chat/data/source_service.dart`.
- Notification token registration/session gating untested: `lib/services/notification_service/fcm_notification_service.dart`.
- Storage cache coherence and failure handling untested: `lib/services/local_storage_service/local_storage_secure_service.dart`.
- Existing tests are mostly empty/commented/network-coupled: `test/features/dog_image_random_bloc_test.dart`, `test/widget_test.dart`, `packages/local_database/test/local_database_test.dart`, `packages/rest_client/test/rest_client_test.dart`.

## Highest leverage first 5 actions
1. Restore build determinism: resolve `pubspec.yaml` -> `packages/gpt_markdown` (add package or remove dependency), then enforce bootstrap in CI.
2. Normalize platform boundaries: isolate `dart:io` behind conditional imports/services and verify web/mobile matrix for `lib/main.dart`, `lib/injector/modules/service_module.dart`, `lib/data/repositories/profile/profile_repository_impl.dart`.
3. Fix route contract: remove duplicate root path and pin canonical app entry in `lib/router/app_router.dart` + `lib/features/app/view/app_director.dart`.
4. Unify auth/session transport: pick cookie-only or bearer-only; refactor `lib/injector/modules/dio_module.dart`, `lib/data/repositories/chat/chat_repository_impl.dart`, `lib/features/auth/cubit/auth_cubit.dart`.
5. Establish minimal high-signal tests first: add unit tests for auth cubit, dio interceptor policy, router uniqueness, and chat SSE transform (`test/features/**`, `test/router/**`, `test/data/**`).

---

## 2026-02-25 App Store 2.1 focused audit addendum (Codex)

Confirmed blockers with direct rejection risk:
1. Registration payload contract break:
   - `lib/features/auth/view/register_screen.dart:294-313`
   - `lib/features/auth/cubit/auth_cubit.dart:176-191`
   - backend check: `POST /api/v1/auth/register` without `name` => HTTP 422 (`body.name` missing)
2. Unsupported SSO affordance shown in auth surfaces:
   - `lib/features/auth/view/auth_screen.dart:174-188`
   - `lib/features/auth/view/auth_bottom_sheet.dart:83-91`
3. Legal links non functional in auth surface:
   - `lib/features/auth/view/auth_screen.dart:195-212` (`onTap: () {}`)
   - `lib/features/auth/view/auth_bottom_sheet.dart:96-121` (plain text, not tappable)

High risk, likely reviewer-visible quality issues:
4. Avatar rendering fallback does not include `profile.image`:
   - `lib/features/setting/account_screen.dart:138`
   - `packages/rest_client/lib/src/models/profile/profile_models.dart:13-15` (both `image` and `image_url` exist)
5. Dead or placeholder actions in reviewer path:
   - Chat attachment options wired to no-op + "feature coming soon" snackbar:
     - `lib/features/chat/view/conversation_screen.dart:1034-1051,1070-1076`
     - `lib/features/chat/view/conversation_history_screen.dart:1102-1119,1138-1144`
   - Forgot password button shows success snackbar without backend call:
     - `lib/features/auth/view/email_signin_screen.dart:420-432`

Control checks (not blockers):
- Cookie->login->authenticated endpoint sequence with provided admin credentials works (`/auth/login`, `/auth/me`, `/profile/me` all 200 in current run).
