import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:insider/generated/l10n.dart';

class ConversationInput extends StatefulWidget {
  final bool isDark;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ChatMode chatMode;
  final bool isStreaming;
  final bool hasCustomSelection;
  final VoidCallback onSend;
  final VoidCallback onStop;
  final VoidCallback onOpenSourceSelector;
  final VoidCallback onAttach;
  final VoidCallback onChangeModel;
  final ValueChanged<ChatMode> onModeChanged;

  const ConversationInput({
    super.key,
    required this.isDark,
    required this.controller,
    required this.focusNode,
    required this.chatMode,
    required this.isStreaming,
    required this.hasCustomSelection,
    required this.onSend,
    required this.onStop,
    required this.onOpenSourceSelector,
    required this.onAttach,
    required this.onChangeModel,
    required this.onModeChanged,
  });

  @override
  State<ConversationInput> createState() => _ConversationInputState();
}

class _ConversationInputState extends State<ConversationInput> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(covariant ConversationInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode.removeListener(_handleFocusChange);
      widget.focusNode.addListener(_handleFocusChange);
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        DesignSystem.spacing16,
        DesignSystem.spacing16,
        DesignSystem.spacing16,
        DesignSystem.spacing20,
      ),
      decoration: BoxDecoration(
        color:
            isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight,
      ),
      child: AnimatedContainer(
        duration: DesignSystem.durationNormal,
        curve: Curves.easeOutCubic,
        constraints: const BoxConstraints(minHeight: 88),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: widget.focusNode.hasFocus
                ? DesignSystem.primaryCyan.withOpacity(0.5)
                : (isDark ? const Color(0xFF333333) : const Color(0xFFE5E5E5)),
            width: 1.5,
          ),
          boxShadow: widget.focusNode.hasFocus
              ? [
                  BoxShadow(
                    color: DesignSystem.primaryCyan.withOpacity(0.15),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 14,
                left: 16,
                right: 16,
                bottom: 8,
              ),
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                minLines: 1,
                maxLines: 5,
                textCapitalization: TextCapitalization.sentences,
                style: DesignSystem.bodyLarge.copyWith(
                  color: isDark
                      ? DesignSystem.textPrimaryDark
                      : DesignSystem.textPrimaryLight,
                  height: 1.5,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: S.current.input_placeholder,
                  hintStyle: DesignSystem.bodyLarge.copyWith(
                    color: isDark
                        ? const Color(0xFF666666)
                        : const Color(0xFFAAAAAA),
                    fontSize: 18,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
                onSubmitted: widget.controller.text.trim().isNotEmpty
                    ? (_) => widget.onSend()
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // _buildCircleActionButton(
                      //   icon: Icons.add,
                      //   isDark: isDark,
                      //   onTap: widget.onAttach,
                      // ),
                      // const SizedBox(width: 8),
                      // Mode Pill
                      GestureDetector(
                        onTap: () {
                          _showModeSelection(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? (widget.chatMode != ChatMode.simpleQa
                                    ? DesignSystem.primaryCyan
                                        .withValues(alpha: 0.1)
                                    : const Color(0xFF2C2C2C))
                                : (widget.chatMode != ChatMode.simpleQa
                                    ? DesignSystem.primaryCyan
                                        .withValues(alpha: 0.05)
                                    : const Color(0xFFF0F0F0)),
                            borderRadius: BorderRadius.circular(20),
                            // Minimal border for a premium feel
                            border: Border.all(
                              color: widget.chatMode != ChatMode.simpleQa
                                  ? DesignSystem.primaryCyan
                                      .withValues(alpha: 0.2)
                                  : Colors.transparent,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                widget.chatMode == ChatMode.simpleQa
                                    ? Icons.search
                                    : (widget.chatMode == ChatMode.deepQa
                                        ? Icons.manage_search
                                        : Icons.saved_search),
                                size: 16,
                                color: widget.chatMode != ChatMode.simpleQa
                                    ? DesignSystem.primaryCyan
                                    : (isDark
                                        ? const Color(0xFFAAAAAA)
                                        : const Color(0xFF666666)),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                widget.chatMode == ChatMode.simpleQa
                                    ? S.current.search_mode_short
                                    : (widget.chatMode == ChatMode.deepQa
                                        ? S.current.research_mode_short
                                        : S.current.pro_search_mode_short),
                                style: DesignSystem.captionSmall.copyWith(
                                  color: widget.chatMode != ChatMode.simpleQa
                                      ? DesignSystem.primaryCyan
                                      : (isDark
                                          ? const Color(0xFFDDDDDD)
                                          : const Color(0xFF666666)),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 16,
                                color: widget.chatMode != ChatMode.simpleQa
                                    ? DesignSystem.primaryCyan
                                        .withValues(alpha: 0.7)
                                    : (isDark
                                        ? const Color(0xFF666666)
                                        : const Color(0xFF999999)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _IconButton(
                        icon: Icons.language,
                        isDark: isDark,
                        color: widget.hasCustomSelection
                            ? DesignSystem.primaryCyan
                            : null,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          widget.onOpenSourceSelector();
                        },
                      ),
                      const SizedBox(width: 8),
                      // Send/Stop Button
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: widget.controller,
                        builder: (context, value, child) {
                          final hasText = value.text.trim().isNotEmpty;
                          final isStreaming = widget.isStreaming;

                          return AnimatedScale(
                            duration: const Duration(milliseconds: 200),
                            scale: (hasText || isStreaming) ? 1.0 : 0.9,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: (hasText || isStreaming)
                                    ? (isDark ? Colors.white : Colors.black)
                                    : (isDark
                                        ? const Color(0xFF333333)
                                        : const Color(0xFFDDDDDD)),
                                shape: BoxShape.circle,
                                boxShadow: (hasText || isStreaming)
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: isStreaming
                                      ? widget.onStop
                                      : (hasText ? widget.onSend : null),
                                  borderRadius: BorderRadius.circular(18),
                                  child: Center(
                                    child: isStreaming
                                        ? Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              color: isDark
                                                  ? Colors.black
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                          )
                                        : Icon(
                                            Icons.arrow_upward_rounded,
                                            color: (hasText || isStreaming)
                                                ? (isDark
                                                    ? Colors.black
                                                    : Colors
                                                        .white) // Inverse of bg
                                                : (isDark
                                                    ? const Color(0xFF666666)
                                                    : Colors.white),
                                            size: 20,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildCircleActionButton({
  //   required IconData icon,
  //   required bool isDark,
  //   required VoidCallback onTap,
  // }) {
  //   return GestureDetector(
  //     onTap: () {
  //       HapticFeedback.lightImpact();
  //       onTap();
  //     },
  //     child: Container(
  //       width: 32,
  //       height: 32,
  //       decoration: BoxDecoration(
  //         color: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFE0E0E0),
  //         borderRadius: BorderRadius.circular(16),
  //       ),
  //       child: Center(
  //         child: Icon(
  //           icon,
  //           size: 18,
  //           color: isDark ? const Color(0xFFDDDDDD) : const Color(0xFF666666),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _showModeSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
                border: Border(
                  top: BorderSide(
                    color: isDark
                        ? Colors.white.withOpacity(0.1)
                        : Colors.black.withOpacity(0.05),
                    width: 1,
                  ),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.current.choose_mode,
                            style: DesignSystem.titleMedium.copyWith(
                              color: isDark
                                  ? DesignSystem.textPrimaryDark
                                  : DesignSystem.textPrimaryLight,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.white.withOpacity(0.1)
                                    : Colors.black.withOpacity(0.05),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: isDark
                                    ? DesignSystem.textSecondaryDark
                                    : DesignSystem.textSecondaryLight,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 32,
                        ),
                        children: [
                          _buildModeTile(
                            icon: Icons.search,
                            title: S.current.search_mode,
                            subtitle: S.current.search_mode_subtitle,
                            isSelected: widget.chatMode == ChatMode.simpleQa,
                            isDark: isDark,
                            onTap: () {
                              debugPrint(
                                  '[ConversationInput] Simple QA tapped');
                              widget.onModeChanged(ChatMode.simpleQa);
                              Navigator.pop(context);
                            },
                          ),
//                           _buildModeTile(
//                             icon: Icons.manage_search,
//                             title: S.current.pro_search_mode,
//                             subtitle: S.current.pro_search_mode_subtitle,
//                             isSelected: widget.chatMode == ChatMode.proSearch,
//                             isDark: isDark,
//                             onTap: () {
//                               debugPrint(
//                                   '[ConversationInput] Pro Search tapped');
//                               widget.onModeChanged(ChatMode.proSearch);
//                               Navigator.pop(context);
//                             },
//                           ),
                          _buildModeTile(
                            icon: Icons
                                .saved_search, // Using saved_search for Research as distinct from Pro
                            title: S.current.research_mode,
                            subtitle: S.current.research_mode_subtitle,
                            isSelected: widget.chatMode == ChatMode.deepQa,
                            isDark: isDark,
                            onTap: () {
                              debugPrint('[ConversationInput] Deep QA tapped');
                              widget.onModeChanged(ChatMode.deepQa);
                              Navigator.pop(context);
                            },
                          ),
                          // const SizedBox(height: 12),
                          // _buildToggleTile(
                          //   icon: Icons.visibility_off_outlined,
                          //   title: 'Incognito mode',
                          //   subtitle: 'Activity won\'t be saved',
                          //   isDark: isDark,
                          //   value: false,
                          //   onChanged: (val) {
                          //     Navigator.pop(context);
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //           content:
                          //               Text('Incognito mode coming soon')),
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildModeTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? DesignSystem.primaryCyan.withOpacity(0.12)
              : (isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF5F5F5)),
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: DesignSystem.primaryCyan, width: 1.5)
              : Border.all(color: Colors.transparent, width: 1.5),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? DesignSystem.primaryCyan
                  : (isDark ? Colors.white70 : Colors.black54),
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: DesignSystem.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? DesignSystem.textPrimaryDark
                              : DesignSystem.textPrimaryLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: DesignSystem.bodySmall.copyWith(
                      color: isDark
                          ? DesignSystem.textSecondaryDark
                          : DesignSystem.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: DesignSystem.primaryCyan,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  // Widget _buildToggleTile({
  //   required IconData icon,
  //   required String title,
  //   required String subtitle,
  //   required bool isDark,
  //   required bool value,
  //   required ValueChanged<bool> onChanged,
  // }) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 4),
  //     padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
  //     decoration: BoxDecoration(
  //       color: Colors.transparent,
  //       borderRadius: BorderRadius.circular(16),
  //     ),
  //     child: Row(
  //       children: [
  //         Icon(
  //           icon,
  //           color: isDark ? Colors.white70 : Colors.black54,
  //           size: 24,
  //         ),
  //         const SizedBox(width: 16),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 title,
  //                 style: DesignSystem.bodyLarge.copyWith(
  //                   fontWeight: FontWeight.w600,
  //                   color: isDark
  //                       ? DesignSystem.textPrimaryDark
  //                       : DesignSystem.textPrimaryLight,
  //                 ),
  //               ),
  //               const SizedBox(height: 2),
  //               Text(
  //                 subtitle,
  //                 style: DesignSystem.bodySmall.copyWith(
  //                   color: isDark
  //                       ? DesignSystem.textSecondaryDark
  //                       : DesignSystem.textSecondaryLight,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Switch.adaptive(
  //           value: value,
  //           onChanged: onChanged,
  //           activeColor: DesignSystem.primaryCyan,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final bool isDark;
  final VoidCallback onTap;
  final Color? color;

  const _IconButton({
    required this.icon,
    required this.isDark,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Center(
            child: Icon(
              icon,
              size: 20,
              color: color ??
                  (isDark ? const Color(0xFF999999) : const Color(0xFF666666)),
            ),
          ),
        ),
      ),
    );
  }
}
