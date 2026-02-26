import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:insider/configs/app_config.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/core/keys/app_keys.dart';
import 'package:insider/features/auth/cubit/auth_cubit.dart';
import 'package:insider/features/auth/cubit/auth_state.dart';
import 'package:insider/features/auth/view/auth_bottom_sheet.dart';
import 'package:insider/features/profile/cubit/profile_cubit.dart';
import 'package:insider/features/profile/cubit/profile_state.dart';
import 'package:insider/generated/l10n.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/data/repositories/profile/profile_repository.dart';
import 'package:insider/router/app_router.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';
import 'package:insider/services/notification_service/notification_service.dart';
import 'package:insider/widgets/app_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late final LocalStorageService _localStorage;
  late final NotificationService _notificationService;
  late final ProfileCubit _profileCubit;
  bool _notificationsEnabled = true;
  bool _profileRequested = false;

  static final Uri _feedbackUri = Uri.parse(
    'https://docs.google.com/forms/d/e/1FAIpQLSfqM6VsVuw2mE6V6p2ZoBCllyZL3H2IvBfBk249gB-mBD_YQQ/closedform',
  );

  @override
  void initState() {
    super.initState();
    _localStorage = Injector.instance<LocalStorageService>();
    _notificationService = Injector.instance<NotificationService>();
    _profileCubit = ProfileCubit(
      profileRepository: Injector.instance<ProfileRepository>(),
    );
    _loadNotificationPreference();
  }

  @override
  void dispose() {
    _profileCubit.close();
    super.dispose();
  }

  Future<void> _loadNotificationPreference() async {
    final stored = await _localStorage.getBool(
      key: AppKeys.pushNotificationsEnabledKey,
    );
    if (!mounted || stored == null) return;
    setState(() {
      _notificationsEnabled = stored;
    });
  }

  Future<void> _setNotificationPreference(bool enabled) async {
    final previousValue = _notificationsEnabled;

    setState(() {
      _notificationsEnabled = enabled;
    });

    await _localStorage.setValue(
      key: AppKeys.pushNotificationsEnabledKey,
      value: enabled,
    );

    if (!enabled) return;

    try {
      await _notificationService.init();
      await _notificationService.registerTokenWithServer();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _notificationsEnabled = previousValue;
      });
      await _localStorage.setValue(
        key: AppKeys.pushNotificationsEnabledKey,
        value: previousValue,
      );
      showAppToast(
        context,
        message: e.toString(),
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight,
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            final isAuthenticated = authState.isAuthenticated;
            final user = authState.user;

            if (!isAuthenticated) {
              _profileRequested = false;
              return _buildSettingsBody(
                context,
                isDark,
                isAuthenticated: false,
                displayName: user?.name,
                displayImageUrl: user?.imageUrl ?? user?.image,
              );
            }

            if (!_profileRequested) {
              _profileRequested = true;
              _profileCubit.loadProfile();
            }

            return BlocProvider.value(
              value: _profileCubit,
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, profileState) {
                  final profile = profileState.profile;
                  final displayName = profile?.name ?? user?.name;
                  final displayImageUrl = profile?.imageUrl ??
                      profile?.image ??
                      user?.imageUrl ??
                      user?.image;

                  return _buildSettingsBody(
                    context,
                    isDark,
                    isAuthenticated: true,
                    displayName: displayName,
                    displayImageUrl: displayImageUrl,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSettingsBody(
    BuildContext context,
    bool isDark, {
    required bool isAuthenticated,
    required String? displayName,
    required String? displayImageUrl,
  }) {
    return CustomScrollView(
      slivers: [
        _buildAppBar(context, isDark),
        SliverList(
          delegate: SliverChildListDelegate([
            _buildProfileSection(
              context,
              isDark,
              isAuthenticated,
              displayName,
              displayImageUrl,
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(context, isDark, isAuthenticated),
            _buildNotificationToggle(context, isDark),
            _buildFeedbackCard(context, isDark),
          ]),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Spacer(),
              _buildSignOutButton(
                context,
                isDark,
                isAuthenticated,
              ),
              const SizedBox(height: 24),
              _buildVersionInfo(context, isDark),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context, bool isDark) {
    return SliverAppBar(
      backgroundColor:
          isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight,
      elevation: 0,
      pinned: true,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
          size: 28,
        ),
        onPressed: () {
          HapticFeedback.lightImpact();
          context.pop();
        },
      ),
      title: Text(
        S.of(context).settings_title,
        style: DesignSystem.headingMedium.copyWith(
          color: isDark
              ? DesignSystem.textPrimaryDark
              : DesignSystem.textPrimaryLight,
          fontWeight: DesignSystem.semiBold,
        ),
      ),
    );
  }

  Widget _buildProfileSection(
    BuildContext context,
    bool isDark,
    bool isAuthenticated,
    String? name,
    String? imageUrl,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: DesignSystem.backgroundDark,
              boxShadow: [
                BoxShadow(
                  color:
                      (isDark ? Colors.white : Colors.black).withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: imageUrl != null && imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl.startsWith('http')
                          ? imageUrl
                          : '${AppConfig.baseUrl}${imageUrl.startsWith('/') ? '' : '/'}$imageUrl',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: 28,
                        );
                      },
                    )
                  : const Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name?.isNotEmpty == true ? name! : S.of(context).guest_user,
                  style: DesignSystem.headingSmall.copyWith(
                    color: isDark
                        ? DesignSystem.textPrimaryDark
                        : DesignSystem.textPrimaryLight,
                    fontWeight: DesignSystem.semiBold,
                  ),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () async {
                    HapticFeedback.lightImpact();
                    if (isAuthenticated) {
                      await context.push(AppRouter.accountPath);
                      if (!context.mounted) return;
                      if (context.read<AuthCubit>().state.isAuthenticated) {
                        await context.read<ProfileCubit>().loadProfile();
                      }
                    } else {
                      _showAuthSheet(context);
                    }
                  },
                  child: Text(
                    S.of(context).manage_account,
                    style: DesignSystem.bodyMedium.copyWith(
                      color: const Color(0xFF3478F6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context,
    bool isDark,
    bool isAuthenticated,
  ) {
    return Column(
      children: [
        _SettingsTile(
          icon: Icons.palette_outlined,
          title: S.of(context).theme_title,
          isDark: isDark,
          onTap: () {
            HapticFeedback.lightImpact();
            context.push(AppRouter.themePath);
          },
        ),
        _SettingsTile(
          icon: Icons.language_outlined,
          title: S.of(context).app_language,
          isDark: isDark,
          onTap: () {
            HapticFeedback.lightImpact();
            context.push(AppRouter.languagePath);
          },
        ),
      ],
    );
  }

  Widget _buildNotificationToggle(BuildContext context, bool isDark) {
    return _SettingsTile(
      icon: Icons.notifications_outlined,
      title: S.of(context).push_notifications,
      isDark: isDark,
      trailing: Switch.adaptive(
        value: _notificationsEnabled,
        onChanged: (value) async {
          HapticFeedback.lightImpact();
          await _setNotificationPreference(value);
        },
        activeColor: isDark
            ? DesignSystem.textPrimaryDark
            : DesignSystem.textPrimaryLight,
      ),
    );
  }

  Widget _buildFeedbackCard(BuildContext context, bool isDark) {
    return _SettingsTile(
      icon: Icons.send_outlined,
      title: 'Send feedback',
      isDark: isDark,
      onTap: () => _openFeedbackForm(context),
    );
  }

  Future<void> _openFeedbackForm(BuildContext context) async {
    HapticFeedback.lightImpact();
    final opened = await launchUrl(
      _feedbackUri,
      mode: LaunchMode.externalApplication,
    );

    if (!opened && context.mounted) {
      showAppToast(
        context,
        message: 'Could not open feedback form',
        isError: true,
      );
    }
  }

  Widget _buildSignOutButton(
      BuildContext context, bool isDark, bool isAuthenticated) {
    if (!isAuthenticated) {
      return _buildLoginCard(context, isDark);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            HapticFeedback.mediumImpact();
            context.read<AuthCubit>().logout();
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(
                S.of(context).sign_out,
                style: DesignSystem.bodyMedium.copyWith(
                  color: DesignSystem.error,
                  fontSize: 16,
                  fontWeight: DesignSystem.semiBold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginCard(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                isDark
                    ? DesignSystem.backgroundDarkElevated
                    : DesignSystem.backgroundLightElevated,
                isDark
                    ? DesignSystem.backgroundDarkCard
                    : DesignSystem.backgroundLightCard,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: DesignSystem.borderRadiusLarge,
            border: Border.all(
              color:
                  isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 22,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: DesignSystem.borderRadiusLarge,
            onTap: () {
              HapticFeedback.mediumImpact();
              _showAuthSheet(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isDark
                              ? DesignSystem.backgroundDarkCard
                              : DesignSystem.backgroundLightCard,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.login_rounded,
                          color: isDark
                              ? DesignSystem.iconDark
                              : DesignSystem.iconLight,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).login_card_title,
                              style: DesignSystem.headingSmall.copyWith(
                                color: isDark
                                    ? DesignSystem.textPrimaryDark
                                    : DesignSystem.textPrimaryLight,
                                fontWeight: DesignSystem.semiBold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              S.of(context).login_card_description,
                              style: DesignSystem.bodySmall.copyWith(
                                color: isDark
                                    ? DesignSystem.textSecondaryDark
                                    : DesignSystem.textSecondaryLight,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? DesignSystem.textPrimaryDark
                              : DesignSystem.textPrimaryLight,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.lock_open_rounded,
                                color: isDark
                                    ? DesignSystem.backgroundDark
                                    : DesignSystem.backgroundLight,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                S.of(context).login_action,
                                style: DesignSystem.bodyMedium.copyWith(
                                  color: isDark
                                      ? DesignSystem.backgroundDark
                                      : DesignSystem.backgroundLight,
                                  fontWeight: DesignSystem.semiBold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: isDark
                            ? DesignSystem.iconDark
                            : DesignSystem.iconLight,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVersionInfo(BuildContext context, bool isDark) {
    return Center(
      child: Text(
        'Insider',
        style: DesignSystem.caption.copyWith(
          color: isDark
              ? DesignSystem.textTertiaryDark
              : DesignSystem.textTertiaryLight,
          fontSize: 12,
        ),
      ),
    );
  }

  void _showAuthSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AuthBottomSheet(),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.isDark,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final bool isDark;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color:
                    isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: DesignSystem.bodyMedium.copyWith(
                    color: isDark
                        ? DesignSystem.textPrimaryDark
                        : DesignSystem.textPrimaryLight,
                    fontSize: 16,
                  ),
                ),
              ),
              if (trailing != null)
                trailing!
              else
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color:
                      isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
