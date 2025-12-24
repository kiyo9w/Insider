import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/generated/assets.gen.dart';
import 'package:insider/features/chat/data/source_service.dart';
import 'package:insider/features/chat/view/widgets/source_selector_sheet.dart';

import 'package:insider/generated/l10n.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';

/// Chat View - Reusable component for the main chat interface
class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
    required this.onSend,
    this.chatMode = ChatMode.simpleQa,
    this.onModeChanged,
  });

  final Function(String, ChatMode) onSend;
  final ChatMode chatMode;
  final Function(ChatMode)? onModeChanged;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();
  bool _isInputFocused = false;

  late ChatMode _chatMode;
  final SourceService _sourceService = SourceService.instance;

  @override
  void initState() {
    super.initState();
    _chatMode = widget.chatMode;
    _inputFocusNode.addListener(_onFocusChange);

    // Reset sources to default for a fresh chat session
    _sourceService.reset();

    _inputController.addListener(() {
      setState(() {});
    });

    _sourceService.ensureRemoteResourcesLoaded().then((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant ChatView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.chatMode != widget.chatMode) {
      setState(() {
        _chatMode = widget.chatMode;
      });
    }
  }

  void _onFocusChange() {
    setState(() {
      _isInputFocused = _inputFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              _buildChatContent(context, isDark),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildInputArea(context, isDark),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChatContent(BuildContext context, bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          (isDark ? Assets.images.darkVe : Assets.images.lightVe).image(
            width: 200,
            height: 60,
            fit: BoxFit.contain,
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }

  Widget _buildInputArea(BuildContext context, bool isDark) {
    final hasText = _inputController.text.trim().isNotEmpty;

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
        constraints: const BoxConstraints(
          minHeight: 88,
        ),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: _isInputFocused
                ? DesignSystem.primaryCyan.withOpacity(0.5)
                : (isDark ? const Color(0xFF333333) : const Color(0xFFE5E5E5)),
            width: 1.5,
          ),
          boxShadow: _isInputFocused
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
            // Text input area
            Padding(
              padding: const EdgeInsets.only(
                top: 14,
                left: 16,
                right: 16,
                bottom: 8,
              ),
              child: TextField(
                controller: _inputController,
                focusNode: _inputFocusNode,
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
                onSubmitted: hasText ? (value) => _handleSend() : null,
              ),
            ),
            // Icons row at bottom
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left side: Plus and Mode buttons
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // // Plus Button
                      // _buildCircleActionButton(
                      //   icon: Icons.add,
                      //   isDark: isDark,
                      //   onTap: _showAttachmentOptions,
                      // ),
                      // const SizedBox(width: 8),
                      // Mode Button
                      GestureDetector(
                        onTap: _showModeSelection,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? (_chatMode != ChatMode.simpleQa
                                    ? DesignSystem.primaryCyan
                                        .withValues(alpha: 0.1)
                                    : const Color(0xFF2C2C2C))
                                : (_chatMode != ChatMode.simpleQa
                                    ? DesignSystem.primaryCyan
                                        .withValues(alpha: 0.05)
                                    : const Color(0xFFF0F0F0)),
                            borderRadius: BorderRadius.circular(20),
                            // Minimal border for a premium feel
                            border: Border.all(
                              color: _chatMode != ChatMode.simpleQa
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
                                _chatMode == ChatMode.simpleQa
                                    ? Icons.search
                                    : (_chatMode == ChatMode.deepQa
                                        ? Icons.manage_search
                                        : Icons.saved_search),
                                size: 16,
                                color: _chatMode != ChatMode.simpleQa
                                    ? DesignSystem.primaryCyan
                                    : (isDark
                                        ? const Color(0xFFAAAAAA)
                                        : const Color(0xFF666666)),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _chatMode == ChatMode.simpleQa
                                    ? S.current.search_mode_short
                                    : (_chatMode == ChatMode.deepQa
                                        ? S.current.research_mode_short
                                        : S.current.pro_search_mode_short),
                                style: DesignSystem.captionSmall.copyWith(
                                  color: _chatMode != ChatMode.simpleQa
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
                                color: _chatMode != ChatMode.simpleQa
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

                  // Right side icons: Globe, Send
                  Row(
                    children: [
                      _buildIconButton(
                        icon: Icons.language,
                        isDark: isDark,
                        color: (_sourceService.selectedWebUris.isNotEmpty ||
                                _sourceService
                                    .selectedKnowledgeBaseUris.isNotEmpty)
                            ? DesignSystem.primaryCyan
                            : null,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          _openSourceSelector(isDark);
                        },
                      ),
                      const SizedBox(width: 8),
                      // Send button
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _inputController,
                        builder: (context, value, child) {
                          final hasTextValue = value.text.trim().isNotEmpty;
                          return AnimatedScale(
                            duration: const Duration(milliseconds: 200),
                            scale: hasTextValue ? 1.0 : 0.9,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: hasTextValue
                                    ? (isDark ? Colors.white : Colors.black)
                                    : (isDark
                                        ? const Color(0xFF333333)
                                        : const Color(0xFFDDDDDD)),
                                shape: BoxShape.circle,
                                boxShadow: hasTextValue
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
                                  onTap: hasTextValue ? _handleSend : null,
                                  borderRadius: BorderRadius.circular(18),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_upward_rounded,
                                      color: hasTextValue
                                          ? (isDark
                                              ? Colors.black
                                              : Colors.white)
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

  Widget _buildIconButton({
    required IconData icon,
    required bool isDark,
    required VoidCallback onTap,
    Color? color,
  }) {
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

  void _handleSend() {
    if (_inputController.text.trim().isEmpty) return;

    HapticFeedback.mediumImpact();
    final message = _inputController.text.trim();

    _inputController.clear();
    _inputFocusNode.unfocus();

    widget.onSend(message, _chatMode);
  }

  Future<void> _openSourceSelector(bool isDark) async {
    await SourceSelectorSheet.show(
      context: context,
      isDark: isDark,
      webResources: _sourceService.webResources,
      knowledgeBaseResources: _sourceService.knowledgeBaseResources,
      selectedWebUris: _sourceService.selectedWebUris,
      selectedKnowledgeBaseUris: _sourceService.selectedKnowledgeBaseUris,
      sourceService: _sourceService,
      isWebEnabled: _sourceService.isWebEnabled,
      isKnowledgeBaseEnabled: _sourceService.isKnowledgeBaseEnabled,
    );

    if (mounted) setState(() {});
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

  // void _showAttachmentOptions() {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) {
  //       final isDark = Theme.of(context).brightness == Brightness.dark;
  //       return Container(
  //         decoration: BoxDecoration(
  //           color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
  //           borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
  //           border: Border(
  //             top: BorderSide(
  //               color: isDark
  //                   ? Colors.white.withOpacity(0.1)
  //                   : Colors.black.withOpacity(0.05),
  //               width: 1,
  //             ),
  //           ),
  //         ),
  //         child: SafeArea(
  //           child: Padding(
  //             padding: const EdgeInsets.all(24.0),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       'Sources',
  //                       style: DesignSystem.titleMedium.copyWith(
  //                         color: isDark
  //                             ? DesignSystem.textPrimaryDark
  //                             : DesignSystem.textPrimaryLight,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                     GestureDetector(
  //                       onTap: () => Navigator.pop(context),
  //                       child: Icon(
  //                         Icons.close,
  //                         color: isDark
  //                             ? DesignSystem.textSecondaryDark
  //                             : DesignSystem.textSecondaryLight,
  //                         size: 20,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 24),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     _buildAttachmentOption(
  //                       icon: Icons.image_outlined,
  //                       label: 'Image',
  //                       isDark: isDark,
  //                       onTap: () {},
  //                     ),
  //                     _buildAttachmentOption(
  //                       icon: Icons.camera_alt_outlined,
  //                       label: 'Camera',
  //                       isDark: isDark,
  //                       onTap: () {},
  //                     ),
  //                     _buildAttachmentOption(
  //                       icon: Icons.description_outlined,
  //                       label: 'File',
  //                       isDark: isDark,
  //                       onTap: () {},
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 16),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _buildAttachmentOption({
  //   required IconData icon,
  //   required String label,
  //   required bool isDark,
  //   required VoidCallback onTap,
  // }) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.pop(context);
  //       onTap();
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('$label coming soon')),
  //       );
  //     },
  //     child: Column(
  //       children: [
  //         Container(
  //           width: 80,
  //           height: 80,
  //           decoration: BoxDecoration(
  //             color: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF5F5F5),
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           child: Center(
  //             child: Icon(
  //               icon,
  //               size: 32,
  //               color: isDark
  //                   ? DesignSystem.textPrimaryDark
  //                   : DesignSystem.textPrimaryLight,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Text(
  //           label,
  //           style: DesignSystem.bodySmall.copyWith(
  //             color: isDark
  //                 ? DesignSystem.textSecondaryDark
  //                 : DesignSystem.textSecondaryLight,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  void _showModeSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
                  _buildModeTile(
                    icon: Icons.search,
                    title: S.current.search_mode,
                    subtitle: S.current.search_mode_subtitle,
                    isSelected: _chatMode == ChatMode.simpleQa,
                    isDark: isDark,
                    onTap: () {
                      setState(() {
                        _chatMode = ChatMode.simpleQa;
                        widget.onModeChanged?.call(ChatMode.simpleQa);
                      });
                      Navigator.pop(context);
                    },
                  ),
                  _buildModeTile(
                    icon: Icons.manage_search,
                    title: S.current.pro_search_mode,
                    subtitle: S.current.pro_search_mode_subtitle,
                    isSelected: _chatMode == ChatMode.proSearch,
                    isDark: isDark,
                    onTap: () {
                      setState(() {
                        _chatMode = ChatMode.proSearch;
                        widget.onModeChanged?.call(ChatMode.proSearch);
                      });
                      Navigator.pop(context);
                    },
                  ),
                  _buildModeTile(
                    icon: Icons.saved_search,
                    title: S.current.research_mode,
                    subtitle: S.current.research_mode_subtitle,
                    isSelected: _chatMode == ChatMode.deepQa,
                    isDark: isDark,
                    onTap: () {
                      setState(() {
                        _chatMode = ChatMode.deepQa;
                        widget.onModeChanged?.call(ChatMode.deepQa);
                      });
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
                  //           content: Text('Incognito mode coming soon')),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
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
  //   return InkWell(
  //     onTap: () {
  //       onChanged(!value);
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(vertical: 4),
  //       padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
  //       decoration: BoxDecoration(
  //         color: Colors.transparent,
  //         borderRadius: BorderRadius.circular(16),
  //       ),
  //       child: Row(
  //         children: [
  //           Icon(
  //             icon,
  //             color: isDark ? Colors.white70 : Colors.black54,
  //             size: 24,
  //           ),
  //           const SizedBox(width: 16),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   title,
  //                   style: DesignSystem.bodyLarge.copyWith(
  //                     fontWeight: FontWeight.w600,
  //                     color: isDark
  //                         ? DesignSystem.textPrimaryDark
  //                         : DesignSystem.textPrimaryLight,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 2),
  //                 Text(
  //                   subtitle,
  //                   style: DesignSystem.bodySmall.copyWith(
  //                     color: isDark
  //                         ? DesignSystem.textSecondaryDark
  //                         : DesignSystem.textSecondaryLight,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Switch.adaptive(
  //             value: value,
  //             onChanged: onChanged,
  //             activeColor: DesignSystem.primaryCyan,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
