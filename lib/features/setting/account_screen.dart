import 'dart:io';
import 'package:insider/configs/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/data/repositories/profile/profile_repository.dart';
import 'package:insider/features/auth/cubit/auth_cubit.dart';
import 'package:insider/features/auth/cubit/auth_state.dart';
import 'package:insider/features/auth/view/auth_bottom_sheet.dart';
import 'package:insider/features/profile/cubit/profile_cubit.dart';
import 'package:insider/features/profile/cubit/profile_state.dart';
import 'package:insider/features/setting/edit_profile_screen.dart';
import 'package:insider/generated/l10n.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/widgets/app_toast.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late final ProfileCubit _profileCubit;
  bool _profileRequested = false;

  @override
  void initState() {
    super.initState();
    _profileCubit = ProfileCubit(
      profileRepository: Injector.instance<ProfileRepository>(),
    );
  }

  @override
  void dispose() {
    _profileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Check authentication status first
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        // If not authenticated, show login prompt
        if (!authState.isAuthenticated) {
          _profileRequested = false;
          return Scaffold(
            backgroundColor: isDark
                ? DesignSystem.backgroundDark
                : DesignSystem.backgroundLight,
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(context, isDark),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 80,
                              color: isDark
                                  ? DesignSystem.textTertiaryDark
                                  : DesignSystem.textTertiaryLight,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              S.of(context).account_settings,
                              style: DesignSystem.headingLarge.copyWith(
                                color: isDark
                                    ? DesignSystem.textPrimaryDark
                                    : DesignSystem.textPrimaryLight,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              S.of(context).sign_in_to_manage,
                              textAlign: TextAlign.center,
                              style: DesignSystem.bodyMedium.copyWith(
                                color: isDark
                                    ? DesignSystem.textSecondaryDark
                                    : DesignSystem.textSecondaryLight,
                              ),
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => const AuthBottomSheet(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: DesignSystem.primaryCyan,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                S.of(context).sign_in_action,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // If authenticated, show profile
        if (!_profileRequested) {
          _profileRequested = true;
          _profileCubit.loadProfile();
        }

        return BlocProvider<ProfileCubit>.value(
          value: _profileCubit,
          child: Scaffold(
            backgroundColor: isDark
                ? DesignSystem.backgroundDark
                : DesignSystem.backgroundLight,
            body: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, profileState) {
                // Get user from AuthCubit as fallback
                final authUser = context.read<AuthCubit>().state.user;

                final profile = profileState.profile;
                // Use profile data if available, otherwise fallback to authUser
                final displayName =
                    profile?.name ?? authUser?.name ?? 'Not set';
                final displayEmail =
                    profile?.email ?? authUser?.email ?? 'Not set';
                final displayUsername =
                    profile?.username ?? S.of(context).not_set;
                final displayIntroduction =
                    profile?.introduction ?? S.of(context).not_set;
                final displayLocation =
                    profile?.location ?? S.of(context).not_set;
                final displayImage = profile?.imageUrl ??
                    profile?.image ??
                    authUser?.imageUrl ??
                    authUser?.image;

                // Handle 'Not set' check for edit screen logic safety if needed,
                // but better to pass empty string if it equals localized 'Not set' or just check against null/empty in data.

                String getSafeValue(String? val) =>
                    (val == null || val == S.of(context).not_set) ? '' : val;

                return SafeArea(
                  child: Column(
                    children: [
                      _buildHeader(context, isDark),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              const SizedBox(height: 40),
                              _buildAvatar(context, isDark, displayImage),
                              const SizedBox(height: 32),
                              _buildInfoRow(
                                context,
                                S.of(context).profile_name,
                                displayName == 'Not set'
                                    ? S.of(context).not_set
                                    : displayName,
                                isDark,
                                onTap: () => _navigateToEdit(
                                  context,
                                  EditProfileType.name,
                                  displayName == 'Not set' ||
                                          displayName == S.of(context).not_set
                                      ? ''
                                      : displayName,
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildInfoRow(
                                context,
                                S.of(context).profile_username,
                                displayUsername,
                                isDark,
                                onTap: () => _navigateToEdit(
                                  context,
                                  EditProfileType.username,
                                  getSafeValue(displayUsername),
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildInfoRow(
                                context,
                                S.of(context).profile_email,
                                displayEmail == 'Not set'
                                    ? S.of(context).not_set
                                    : displayEmail,
                                isDark,
                                isReadOnly: true,
                              ),
                              const SizedBox(height: 16),
                              _buildInfoRow(
                                context,
                                S.of(context).profile_introduction,
                                displayIntroduction,
                                isDark,
                                onTap: () => _navigateToEdit(
                                  context,
                                  EditProfileType.introduction,
                                  getSafeValue(displayIntroduction),
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildInfoRow(
                                context,
                                S.of(context).profile_location,
                                displayLocation,
                                isDark,
                                onTap: () => _navigateToEdit(
                                  context,
                                  EditProfileType.location,
                                  getSafeValue(displayLocation),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _navigateToEdit(
      BuildContext context, EditProfileType type, String fieldValue) {
    HapticFeedback.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (routeContext) => BlocProvider.value(
          value: context.read<ProfileCubit>(),
          child: EditProfileScreen(
            type: type,
            fieldValue: fieldValue,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
              ),
            ),
          ),
          Expanded(
            child: Text(
              S.of(context).account_title,
              textAlign: TextAlign.center,
              style: DesignSystem.headingMedium.copyWith(
                color: isDark
                    ? DesignSystem.textPrimaryDark
                    : DesignSystem.textPrimaryLight,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, bool isDark, String? imageUrl) {
    return GestureDetector(
      onTap: () => _showAvatarOptions(context, isDark, imageUrl != null),
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? DesignSystem.backgroundDarkElevated
                  : DesignSystem.backgroundLightElevated,
              border: Border.all(
                color:
                    isDark ? DesignSystem.borderDark : DesignSystem.borderLight,
                width: 1,
              ),
            ),
            child: ClipOval(
              child: imageUrl != null && imageUrl.isNotEmpty
                  ? Image.network(
                      () {
                        if (imageUrl.startsWith('http')) return imageUrl;
                        return '${AppConfig.baseUrl}${imageUrl.startsWith('/') ? '' : '/'}$imageUrl';
                      }(),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person,
                          size: 50,
                          color: isDark
                              ? DesignSystem.textSecondaryDark
                              : DesignSystem.textSecondaryLight,
                        );
                      },
                    )
                  : Icon(
                      Icons.person,
                      size: 50,
                      color: isDark
                          ? DesignSystem.textSecondaryDark
                          : DesignSystem.textSecondaryLight,
                    ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? DesignSystem.backgroundDark
                    : DesignSystem.backgroundLight,
                border: Border.all(
                  color: isDark
                      ? DesignSystem.borderDark
                      : DesignSystem.borderLight,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.edit,
                size: 16,
                color: isDark
                    ? DesignSystem.textSecondaryDark
                    : DesignSystem.textSecondaryLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAvatarOptions(
      BuildContext context, bool isDark, bool hasAvatar) async {
    HapticFeedback.lightImpact();
    final profileCubit = context.read<ProfileCubit>();

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: isDark
          ? DesignSystem.backgroundDarkElevated
          : DesignSystem.backgroundLightElevated,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext modalContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.photo_library,
                    color:
                        isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
                  ),
                  title: Text(
                    S.of(context).choose_from_gallery,
                    style: TextStyle(
                      color: isDark
                          ? DesignSystem.textPrimaryDark
                          : DesignSystem.textPrimaryLight,
                    ),
                  ),
                  onTap: () async {
                    Navigator.pop(modalContext);
                    await _pickAndUploadImage(
                        context, profileCubit, ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                    color:
                        isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
                  ),
                  title: Text(
                    S.of(context).take_photo,
                    style: TextStyle(
                      color: isDark
                          ? DesignSystem.textPrimaryDark
                          : DesignSystem.textPrimaryLight,
                    ),
                  ),
                  onTap: () async {
                    Navigator.pop(modalContext);
                    await _pickAndUploadImage(
                        context, profileCubit, ImageSource.camera);
                  },
                ),
                if (hasAvatar)
                  ListTile(
                    leading: Icon(
                      Icons.delete,
                      color: DesignSystem.error,
                    ),
                    title: Text(
                      S.of(context).remove_avatar,
                      style: TextStyle(
                        color: DesignSystem.error,
                      ),
                    ),
                    onTap: () async {
                      Navigator.pop(modalContext);
                      await profileCubit.deleteAvatar();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickAndUploadImage(
    BuildContext context,
    ProfileCubit profileCubit,
    ImageSource source,
  ) async {
    final picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        final file = File(image.path);
        await profileCubit.uploadAvatar(file);
      }
    } catch (e) {
      if (context.mounted) {
        showAppToast(
          context,
          message: S.of(context).failed_to_pick_image(e.toString()),
          isError: true,
        );
      }
    }
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
    bool isDark, {
    VoidCallback? onTap,
    bool isReadOnly = false,
  }) {
    return GestureDetector(
      onTap: isReadOnly ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isDark
                    ? DesignSystem.textPrimaryDark
                    : DesignSystem.textPrimaryLight,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    value,
                    style: TextStyle(
                      color: isDark
                          ? DesignSystem.textSecondaryDark
                          : DesignSystem.textSecondaryLight,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (!isReadOnly) ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: isDark
                        ? DesignSystem.textTertiaryDark
                        : DesignSystem.textTertiaryLight,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
