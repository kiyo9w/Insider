import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/features/auth/cubit/auth_cubit.dart';
import 'package:insider/features/auth/cubit/auth_state.dart';
import 'package:insider/features/threads/view/threads_list.dart';
import 'package:insider/features/auth/view/auth_bottom_sheet.dart';
import 'package:insider/features/threads/cubit/threads_cubit.dart';
import 'package:insider/generated/l10n.dart';

/// Threads Screen - Displays conversation history
/// Replicates Perplexity's threads list interface
class ThreadsScreen extends StatefulWidget {
  const ThreadsScreen({super.key});

  @override
  State<ThreadsScreen> createState() => _ThreadsScreenState();
}

class _ThreadsScreenState extends State<ThreadsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ThreadsCubit>().getThreads();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight,
      body: SafeArea(
        child: ThreadsView(
          onThreadTap: (threadMap) async {
            final id = threadMap['id'];
            final title = threadMap['title'];
            if (id != null && id.isNotEmpty) {
              context.push(
                AppRouter.conversationRoute(id),
                extra: {'title': title},
              );
            }
          },
        ),
      ),
    );
  }
}

class ThreadsView extends StatefulWidget {
  const ThreadsView({
    super.key,
    this.showFloatingButton = true,
    this.showHeader = true,
    this.onThreadTap,
    this.onNewChat,
  });

  final bool showFloatingButton;
  final bool showHeader;
  final Function(Map<String, String>)? onThreadTap;
  final VoidCallback? onNewChat;

  @override
  State<ThreadsView> createState() => _ThreadsViewState();
}

class _ThreadsViewState extends State<ThreadsView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.isAuthenticated != current.isAuthenticated &&
          current.isAuthenticated,
      listener: (context, state) {
        context.read<ThreadsCubit>().getThreads();
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isLoggedIn = state.user != null;
          return Stack(
            children: [
              Column(
                children: [
                  if (widget.showHeader)
                    _buildHeader(context, isDark)
                  else
                    const SizedBox(height: 30), // Padding when header is hidden
                  if (isLoggedIn) ...[
                    _buildSearchBar(context, isDark),
                    Expanded(
                      child: _buildThreadsList(context, isDark),
                    ),
                  ] else
                    Expanded(
                      child: _buildGuestView(context, isDark),
                    ),
                ],
              ),
              if (widget.showFloatingButton)
                Positioned(
                  right: 16,
                  bottom: 20,
                  child: _buildPenButton(context, isDark),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGuestView(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: const DecorationImage(
            image: AssetImage('assets/images/threads_not_loggedin.jpg'),
            fit: BoxFit.cover,
          ),
          color: isDark ? DesignSystem.backgroundDarkCard : Colors.grey[200],
        ),
        child: Stack(
          children: [
            // Dark gradient overlay to ensure text readability
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).guest_get_started,
                    style: DesignSystem.headingLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    S.of(context).guest_create_thread_desc,
                    style: DesignSystem.bodyLarge.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      height: 1.4,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const AuthBottomSheet(),
                    );
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.tune,
                          color: Colors.black,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          S.of(context).guest_create_thread_button,
                          style: DesignSystem.bodyLarge.copyWith(
                            color: Colors.black,
                            fontWeight: DesignSystem.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DesignSystem.spacing20,
        vertical: DesignSystem.spacing16,
      ),
      // Divider removed as requested
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
              size: 26,
            ),
            onPressed: () {
              context.push(AppRouter.settingPath);
            },
          ),
          Expanded(
            child: Center(
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Text(
                    state.user?.name ?? S.of(context).guest_user,
                    style: DesignSystem.headingMedium.copyWith(
                      color: isDark
                          ? DesignSystem.textPrimaryDark
                          : DesignSystem.textPrimaryLight,
                      fontWeight: DesignSystem.semiBold,
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: isDark ? DesignSystem.iconDark : DesignSystem.iconLight,
              size: 26,
            ),
            onPressed: () {
              if (widget.onNewChat != null) {
                widget.onNewChat!();
              } else if (context.canPop()) {
                context.pop();
              } else {
                context.go(AppRouter.homePath);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DesignSystem.spacing20,
        vertical: DesignSystem.spacing8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? DesignSystem.backgroundDarkElevated
              : DesignSystem.backgroundLightElevated,
          borderRadius: DesignSystem.borderRadiusMedium,
        ),
        child: TextField(
          onChanged: (value) {
            if (_debounce?.isActive ?? false) _debounce!.cancel();
            _debounce = Timer(const Duration(milliseconds: 300), () {
              context.read<ThreadsCubit>().searchThreads(value);
            });
          },
          controller: _searchController,
          focusNode: _searchFocusNode,
          style: DesignSystem.bodyMedium.copyWith(
            color: isDark
                ? DesignSystem.textPrimaryDark
                : DesignSystem.textPrimaryLight,
          ),
          decoration: InputDecoration(
            hintText: S.of(context).search_threads_hint,
            hintStyle: DesignSystem.bodyMedium.copyWith(
              color: isDark
                  ? DesignSystem.textTertiaryDark
                  : DesignSystem.textTertiaryLight,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: isDark
                  ? DesignSystem.textTertiaryDark
                  : DesignSystem.textTertiaryLight,
              size: DesignSystem.iconSizeMedium,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: DesignSystem.spacing16,
              vertical: DesignSystem.spacing12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPenButton(BuildContext context, bool isDark) {
    return Material(
      color: isDark ? DesignSystem.backgroundDarkElevated : Colors.white,
      shape: CircleBorder(
        side: BorderSide(
          color: isDark ? DesignSystem.borderDark : Colors.black26,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          if (widget.onNewChat != null) {
            widget.onNewChat!();
          } else if (context.canPop()) {
            context.pop();
          } else {
            context.go(AppRouter.homePath);
          }
        },
        customBorder: const CircleBorder(),
        child: Container(
          width: 56,
          height: 56,
          alignment: Alignment.center,
          child: Icon(
            Icons.edit_outlined,
            color: isDark ? DesignSystem.iconDark : Colors.black87,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildThreadsList(BuildContext context, bool isDark) {
    return ThreadsList(
      isDark: isDark,
      onThreadTap: widget.onThreadTap,
    );
  }
}
