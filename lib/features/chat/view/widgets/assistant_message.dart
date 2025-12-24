import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:insider/features/chat/view/conversation_message.dart';
import 'package:insider/features/chat/view/widgets/markdown_text.dart';
import 'package:insider/generated/l10n.dart';
import 'package:insider/features/chat/view/widgets/source_utils.dart';
import 'package:insider/generated/assets.gen.dart';
import 'package:shimmer/shimmer.dart';

class AssistantMessage extends StatefulWidget {
  final ConversationMessage message;
  final bool isDark;
  final int sourceCount;
  final void Function(List<int>? filterIndices) onSourcesTap;
  final void Function(String question) onRelatedQuestionTap;
  final bool isSearching;
  final bool isReading;
  final int readingCount;
  final List<String> searchQueries;
  final VoidCallback? onRetry;

  const AssistantMessage({
    super.key,
    required this.message,
    required this.isDark,
    required this.sourceCount,
    required this.onSourcesTap,
    required this.onRelatedQuestionTap,
    this.isSearching = false,
    this.isReading = false,
    this.readingCount = 0,
    this.searchQueries = const [],
    this.onRetry,
  });

  @override
  State<AssistantMessage> createState() => _AssistantMessageState();
}

class _AssistantMessageState extends State<AssistantMessage> {
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasAgentSteps = widget.message.agentSteps != null &&
        widget.message.agentSteps!.isNotEmpty;
    final hasImages =
        widget.message.images != null && widget.message.images!.isNotEmpty;

    return Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasImages) ...[
                  _ContentSwitcher(
                    selectedIndex: _selectedTabIndex,
                    isDark: widget.isDark,
                    onChanged: (index) {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                ],
                if (hasImages)
                  _selectedTabIndex == 0
                      ? _buildAnswerContent(hasAgentSteps)
                      : _buildImagesContent()
                else
                  _buildAnswerContent(hasAgentSteps),
              ],
            ),
          ),
        ));
  }

  Widget _buildAnswerContent(bool hasAgentSteps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.message.isStreaming && widget.message.content.isEmpty) ...[
          const SizedBox(height: 4),
          const InsiderProBadge(),
          if (widget.sourceCount > 0)
            SourcesButton(
              count: widget.sourceCount,
              sources: widget.message.sources,
              isDark: widget.isDark,
              onTap: () {},
            ),
          const SizedBox(height: 4),
        ],
        if (hasAgentSteps)
          ExpertSearchPreview(
            isDark: widget.isDark,
            agentSteps: widget.message.agentSteps!,
            sourceCount: widget.sourceCount,
            isSearching: widget.message.content.isEmpty && widget.isSearching,
            isReading: widget.message.content.isEmpty && widget.isReading,
            isStreaming:
                widget.message.isStreaming && widget.message.content.isEmpty,
          ),
        if (widget.message.isStreaming && widget.message.content.isEmpty) ...[
          if (!hasAgentSteps) const SizedBox(height: 8),
          MessageShimmer(isDark: widget.isDark),
        ] else if (widget.message.content.isNotEmpty) ...[
          if (!hasAgentSteps) const SizedBox(height: 8),
          Row(
            children: [
              const InsiderProBadge(),
              if (widget.sourceCount > 0) ...[
                const SizedBox(width: 8),
                SourcesButton(
                  count: widget.sourceCount,
                  sources: widget.message.sources,
                  isDark: widget.isDark,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    widget.onSourcesTap(null);
                  },
                ),
              ],
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: widget.message.isError
                ? _buildRetryMessage(
                    context, widget.message.content, widget.onRetry)
                : MarkdownText(
                    text: widget.message.content,
                    isDark: widget.isDark,
                    sources: widget.message.sources,
                    onCitationTap: (indices) => widget.onSourcesTap(indices),
                  ),
          ),
          _MessageActions(
            message: widget.message.content,
            isDark: widget.isDark,
            onRetry: widget.message.isError ? widget.onRetry : null,
          ),
        ],
        if (widget.message.relatedQueries != null &&
            widget.message.relatedQueries!.isNotEmpty)
          RelatedQuestions(
            questions: widget.message.relatedQueries!,
            isDark: widget.isDark,
            onTap: widget.onRelatedQuestionTap,
          ),
      ],
    );
  }

  Widget _buildImagesContent() {
    final images = widget.message.images ?? [];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _showFullImage(context, images[index]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  void _showFullImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Center(
            child: InteractiveViewer(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRetryMessage(
      BuildContext context, String errorText, VoidCallback? onRetry) {
    // Map error text to types based on available assets/logic
    // "Server is busy" => Timeout style
    // "Server error" => Event style?
    // "Connection error" => Network style

    if (errorText.contains('Server is busy')) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:
              widget.isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.imgErrorConnection.image(width: 137, height: 83),
            const SizedBox(height: 16),
            Text(
              S.current.server_busy,
              style: DesignSystem.bodyLarge.copyWith(
                color: widget.isDark
                    ? DesignSystem.textSecondaryDark
                    : DesignSystem.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: onRetry,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Text(
                  S.current.retry_action,
                  style: DesignSystem.bodyLarge.copyWith(
                    color: DesignSystem.primaryCyan,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // Generic Error / Network Error
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.isDark
              ? const Color(0xFF3E1F1F)
              : const Color(0xFFFFF2F2), // Red tint
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  color: widget.isDark
                      ? const Color(0xFFEF5350)
                      : const Color(0xFFD32F2F),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    errorText.contains('Connection')
                        ? S.current.connection_error
                        : S.current.response_exception,
                    style: DesignSystem.titleMedium.copyWith(
                      color: widget.isDark
                          ? const Color(0xFFEF5350)
                          : const Color(0xFFD32F2F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              errorText,
              style: DesignSystem.bodyMedium.copyWith(
                color: widget.isDark
                    ? const Color(0xFFFFCDD2)
                    : const Color(0xFFB71C1C),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: onRetry,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    S.current.reload,
                    style: DesignSystem.bodyMedium.copyWith(
                      color: widget.isDark
                          ? const Color(0xFFEF5350)
                          : const Color(0xFFD32F2F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class SourcesButton extends StatelessWidget {
  const SourcesButton({
    super.key,
    required this.count,
    required this.sources,
    required this.isDark,
    required this.onTap,
  });

  final int count;
  final List<dynamic>? sources;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final effectiveSources = sources ?? const [];

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isDark
                ? DesignSystem.backgroundDarkElevated
                : DesignSystem.backgroundLightElevated,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isDark
                  ? DesignSystem.borderDark.withOpacity(0.5)
                  : DesignSystem.borderLight.withOpacity(0.5),
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (effectiveSources.isNotEmpty) ...[
                SizedBox(
                  height: 16,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0;
                          i < min(effectiveSources.length, 3);
                          i++) ...[
                        if (i > 0) const SizedBox(width: 4),
                        Builder(builder: (context) {
                          final source = effectiveSources[i];
                          String? url;
                          if (source is SearchResult) {
                            url = source.url;
                          } else if (source is Map) {
                            url = source['url'];
                          }
                          final faviconUrl =
                              url != null ? getFaviconUrl(url) : null;

                          return Container(
                            width: 16,
                            height: 16,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDark
                                  ? const Color(0xFF333333)
                                  : const Color(0xFFEEEEEE),
                            ),
                            child: ClipOval(
                              child: faviconUrl != null
                                  ? Image.network(
                                      faviconUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) => Icon(
                                        Icons.public,
                                        size: 10,
                                        color: isDark
                                            ? Colors.grey[400]
                                            : Colors.grey[600],
                                      ),
                                    )
                                  : Icon(
                                      Icons.description_outlined,
                                      size: 10,
                                      color: isDark
                                          ? Colors.grey[400]
                                          : Colors.grey[600],
                                    ),
                            ),
                          );
                        }),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                '$count Sources',
                style: TextStyle(
                  color: isDark
                      ? DesignSystem.textPrimaryDark
                      : DesignSystem.textPrimaryLight,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.chevron_right,
                size: 16,
                color: isDark
                    ? DesignSystem.textSecondaryDark
                    : DesignSystem.textSecondaryLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageShimmer extends StatelessWidget {
  const MessageShimmer({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLine(width: double.infinity, isDark: isDark),
          const SizedBox(height: 12),
          ShimmerLine(width: double.infinity, isDark: isDark),
          const SizedBox(height: 12),
          ShimmerLine(width: 280, isDark: isDark),
          const SizedBox(height: 12),
          ShimmerLine(width: double.infinity, isDark: isDark),
          const SizedBox(height: 12),
          ShimmerLine(width: 240, isDark: isDark),
        ],
      ),
    );
  }
}

class InsiderProBadge extends StatelessWidget {
  const InsiderProBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              DesignSystem.primaryCyan,
              DesignSystem.primaryCyanLight,
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 12,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              S.current.insider_badge,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                height: 1.3,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RelatedQuestions extends StatelessWidget {
  const RelatedQuestions({
    super.key,
    required this.questions,
    required this.isDark,
    required this.onTap,
  });

  final List<String> questions;
  final bool isDark;
  final void Function(String question) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(questions.length, (index) {
          return _AnimatedQuestionTile(
            question: questions[index],
            index: index,
            isDark: isDark,
            onTap: onTap,
          );
        }),
      ),
    );
  }
}

class _AnimatedQuestionTile extends StatefulWidget {
  final String question;
  final int index;
  final bool isDark;
  final void Function(String) onTap;

  const _AnimatedQuestionTile({
    required this.question,
    required this.index,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_AnimatedQuestionTile> createState() => _AnimatedQuestionTileState();
}

class _AnimatedQuestionTileState extends State<_AnimatedQuestionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    // Stagger start based on index
    Future.delayed(Duration(milliseconds: 100 * widget.index), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            widget.onTap(widget.question);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: widget.isDark
                  ? DesignSystem.backgroundDarkElevated
                  : DesignSystem.backgroundLightElevated,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.isDark
                    ? DesignSystem.borderDark.withOpacity(0.6)
                    : DesignSystem.borderLight.withOpacity(0.6),
                width: 0.5,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.subdirectory_arrow_right,
                  size: 17,
                  color: widget.isDark
                      ? DesignSystem.textSecondaryDark
                      : DesignSystem.textSecondaryLight,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.question,
                    style: TextStyle(
                      color: widget.isDark
                          ? DesignSystem.textPrimaryDark
                          : DesignSystem.textPrimaryLight,
                      fontSize: 14,
                      height: 1.45,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerLine extends StatelessWidget {
  const ShimmerLine({
    super.key,
    required this.width,
    required this.isDark,
  });

  final double width;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isDark
          ? DesignSystem.backgroundDarkElevated
          : DesignSystem.backgroundLightElevated,
      highlightColor: isDark ? DesignSystem.backgroundDarkCard : Colors.white,
      period: const Duration(milliseconds: 1200),
      child: Container(
        width: width,
        height: 16,
        decoration: BoxDecoration(
          color: isDark
              ? DesignSystem.backgroundDarkElevated
              : DesignSystem.backgroundLightElevated,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

/// Expert Search Preview - matches reference design exactly
/// Inline streaming: "Working..." header with left accent bar, no card borders
/// After completion: Tapping opens bottom sheet with full timeline
class ExpertSearchPreview extends StatefulWidget {
  const ExpertSearchPreview({
    super.key,
    required this.isDark,
    required this.agentSteps,
    required this.isSearching,
    required this.isReading,
    this.isStreaming = true,
    this.sourceCount = 0,
  });

  final bool isDark;
  final List<AgentStep> agentSteps;
  final bool isSearching;
  final bool isReading;
  final bool isStreaming;
  final int sourceCount;

  @override
  State<ExpertSearchPreview> createState() => _ExpertSearchPreviewState();
}

class _ExpertSearchPreviewState extends State<ExpertSearchPreview> {
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isStreaming;
  }

  @override
  void didUpdateWidget(covariant ExpertSearchPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Auto-collapse when we stop streaming (start showing answer)
    if (oldWidget.isStreaming && !widget.isStreaming) {
      setState(() => _isExpanded = false);
    }
  }

  void _handleHeaderTap() {
    HapticFeedback.lightImpact();
    // Always toggle expansion if we are in the "retained" state (answer streaming or done)
    if (!widget.isStreaming) {
      _showDetailsBottomSheet();
    } else {
      setState(() => _isExpanded = !_isExpanded);
    }
  }

  void _showDetailsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _ExpertSearchBottomSheet(
        isDark: widget.isDark,
        agentSteps: widget.agentSteps,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textSecondary = widget.isDark
        ? DesignSystem.textSecondaryDark
        : DesignSystem.textSecondaryLight;

    final totalSteps = widget.agentSteps.length;

    // After streaming completed (or while answering) - show collapsed "Reviewed X sources" style
    if (!widget.isStreaming) {
      return GestureDetector(
        onTap: _handleHeaderTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Text(
                widget.sourceCount > 0
                    ? S.current.reviewed_sources(widget.sourceCount)
                    : S.current.completed_steps(totalSteps),
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: textSecondary,
              ),
            ],
          ),
        ),
      );
    }

    // During thinking phase - inline expandable view with accumulated steps
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row: sparkle icon + "Working..." + chevron
        GestureDetector(
          onTap: _handleHeaderTap,
          behavior: HitTestBehavior.opaque,
          child: Row(
            children: [
              // Sparkle icon
              Icon(
                Icons.auto_awesome,
                size: 16,
                color: textSecondary,
              ),
              const SizedBox(width: 6),
              Shimmer.fromColors(
                baseColor: textSecondary,
                highlightColor: widget.isDark
                    ? Colors.white
                    : Colors.black.withOpacity(0.5),
                period: const Duration(seconds: 2),
                child: Text(
                  S.current.working_status,
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              AnimatedRotation(
                turns: _isExpanded ? 0 : -0.25,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 18,
                  color: textSecondary,
                ),
              ),
            ],
          ),
        ),

        // Expanded content with left accent bar
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left accent bar (gray vertical line)
                  Container(
                    width: 2,
                    margin: const EdgeInsets.only(left: 2),
                    decoration: BoxDecoration(
                      color: textSecondary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Content - List of steps
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final step in widget.agentSteps
                            .where((s) => s.status != AgentStepStatus.pending)
                            .indexed) ...[
                          if (step.$1 > 0) const SizedBox(height: 16),
                          _InlineStepContent(
                            step: step.$2,
                            isDark: widget.isDark,
                            // Only animate the last visible step
                            isActive: step.$2 ==
                                widget.agentSteps
                                    .where((s) =>
                                        s.status != AgentStepStatus.pending)
                                    .last,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}

/// Inline step content shown during streaming - matches reference design
class _InlineStepContent extends StatelessWidget {
  const _InlineStepContent({
    required this.step,
    required this.isDark,
    this.isActive = false,
  });

  final AgentStep step;
  final bool isDark;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final textPrimary =
        isDark ? DesignSystem.textPrimaryDark : DesignSystem.textPrimaryLight;
    final textSecondary = isDark
        ? DesignSystem.textSecondaryDark
        : DesignSystem.textSecondaryLight;

    Widget buildShimmerText(String text, {bool isHeader = false}) {
      // For headers, use plain text
      if (isHeader) {
        return Text(
          text,
          style: TextStyle(
            color: textSecondary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
        );
      }

      // For content, use MarkdownText for proper rendering
      final textWidget = MarkdownText(
        text: text,
        isDark: isDark,
        sources: null, // Agent thoughts don't have citations
        onCitationTap: null,
      );

      if (!isActive) {
        return textWidget;
      }

      // Apply shimmer effect to active content
      return Shimmer.fromColors(
        baseColor: textPrimary.withOpacity(0.9),
        highlightColor: isDark ? Colors.white : Colors.black.withOpacity(0.5),
        period: const Duration(seconds: 2),
        child: textWidget,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title text (Always show if present)
        if (step.title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: buildShimmerText(step.title),
          ),

        // SEARCHING section
        if (step.queries.isNotEmpty) ...[
          buildShimmerText(S.current.searching_label, isHeader: true),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              ...step.queries.take(8).map((query) => _SearchPill(
                    query: query,
                    isDark: isDark,
                  )),
              if (step.queries.length > 8)
                _MorePill(
                  count: step.queries.length - 8,
                  isDark: isDark,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => _OverflowItemsBottomSheet(
                        title: S.current.search_queries,
                        items: step.queries,
                        isDark: isDark,
                      ),
                    );
                  },
                ),
            ],
          ),
          const SizedBox(height: 12),
        ],

        // RESULTS section (formerly READING)
        if (step.results.isNotEmpty) ...[
          Row(
            children: [
              buildShimmerText(S.current.results_label, isHeader: true),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${step.results.length}',
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              ...step.results.take(8).map((result) => _SourcePill(
                    result: result,
                    isDark: isDark,
                  )),
              if (step.results.length > 8)
                _MorePill(
                  count: step.results.length - 8,
                  isDark: isDark,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => _OverflowItemsBottomSheet(
                        title: S.current.results,
                        items: step.results,
                        isDark: isDark,
                      ),
                    );
                  },
                ),
            ],
          ),
          const SizedBox(height: 12),
        ],

        // UNDERSTANDING RESULTS section (Thought)
        if (step.thought != null && step.thought!.isNotEmpty) ...[
          if (step.queries.isNotEmpty || step.results.isNotEmpty)
            const SizedBox(height: 12),
          buildShimmerText(S.current.understanding_results_label,
              isHeader: true),
          const SizedBox(height: 8),
          buildShimmerText(step.thought!),
        ],
      ],
    );
  }
}

/// Bottom sheet for completed expert search - matches reference design
class _ExpertSearchBottomSheet extends StatelessWidget {
  const _ExpertSearchBottomSheet({
    required this.isDark,
    required this.agentSteps,
  });

  final bool isDark;
  final List<AgentStep> agentSteps;

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? const Color(0xFF1C1C1E) : Colors.white;
    final textPrimary =
        isDark ? DesignSystem.textPrimaryDark : DesignSystem.textPrimaryLight;
    final textSecondary = isDark
        ? DesignSystem.textSecondaryDark
        : DesignSystem.textSecondaryLight;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(top: 8, bottom: 12),
              decoration: BoxDecoration(
                color: textSecondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Header: "Gemini 3.0 Pro [pro]" + "N steps"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  S.current.retry,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  '${agentSteps.length} steps',
                  style: TextStyle(
                    color: textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Timeline content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Column(
                children: agentSteps.asMap().entries.map((entry) {
                  final index = entry.key;
                  final step = entry.value;
                  final isLast = index == agentSteps.length - 1;
                  return _TimelineStepItem(
                    step: step,
                    isDark: isDark,
                    isLast: isLast,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Timeline step item for bottom sheet - matches reference exactly
class _TimelineStepItem extends StatelessWidget {
  const _TimelineStepItem({
    required this.step,
    required this.isDark,
    required this.isLast,
  });

  final AgentStep step;
  final bool isDark;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final textPrimary =
        isDark ? DesignSystem.textPrimaryDark : DesignSystem.textPrimaryLight;
    final textSecondary = isDark
        ? DesignSystem.textSecondaryDark
        : DesignSystem.textSecondaryLight;
    final lineColor = textSecondary.withOpacity(0.2);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator (dot + line)
          SizedBox(
            width: 20,
            child: Column(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: textSecondary.withOpacity(0.4),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1,
                      margin: const EdgeInsets.only(top: 4),
                      color: lineColor,
                    ),
                  ),
              ],
            ),
          ),
          // Step content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Step thought/description - use MarkdownText for proper rendering
                  if (step.thought != null && step.thought!.isNotEmpty)
                    MarkdownText(
                      text: step.thought!,
                      isDark: isDark,
                      sources: null,
                      onCitationTap: null,
                    )
                  else if (step.title.isNotEmpty)
                    MarkdownText(
                      text: step.title,
                      isDark: isDark,
                      sources: null,
                      onCitationTap: null,
                    ),

                  // SEARCHING section
                  if (step.queries.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text(
                      S.current.searching_label,
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        ...step.queries.take(4).map((query) => _SearchPill(
                              query: query,
                              isDark: isDark,
                            )),
                        if (step.queries.length > 4)
                          _MorePill(
                            count: step.queries.length - 4,
                            isDark: isDark,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => _OverflowItemsBottomSheet(
                                  title: S.current.search_queries,
                                  items: step.queries,
                                  isDark: isDark,
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ],

                  // RESULTS section (formerly READING)
                  if (step.results.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          S.current.results_label,
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 1),
                          decoration: BoxDecoration(
                            color: isDark
                                ? Colors.white.withOpacity(0.08)
                                : Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '${step.results.length}',
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        ...step.results.take(8).map((result) => _SourcePill(
                              result: result,
                              isDark: isDark,
                            )),
                        if (step.results.length > 8)
                          _MorePill(
                            count: step.results.length - 8,
                            isDark: isDark,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => _OverflowItemsBottomSheet(
                                  title: S.current.results,
                                  items: step.results,
                                  isDark: isDark,
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Search query pill - dark rounded rectangle with search icon
class _SearchPill extends StatelessWidget {
  const _SearchPill({
    required this.query,
    required this.isDark,
  });

  final String query;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? const Color(0xFF2C2C2E) : const Color(0xFFE8E8E8);
    final textColor =
        isDark ? Colors.white.withOpacity(0.85) : Colors.black.withOpacity(0.8);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search,
            size: 12,
            color: textColor.withOpacity(0.6),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              _truncate(query, 35),
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  String _truncate(String text, int maxLen) {
    if (text.length <= maxLen) return text;
    return '${text.substring(0, maxLen - 3)}...';
  }
}

/// Source pill - shows favicon + source name
class _SourcePill extends StatelessWidget {
  const _SourcePill({
    required this.result,
    required this.isDark,
  });

  final AgentStepResult result;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? const Color(0xFF2C2C2E) : const Color(0xFFE8E8E8);
    final textColor =
        isDark ? Colors.white.withOpacity(0.85) : Colors.black.withOpacity(0.8);
    final sourceName = _extractDomain(result.url);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (result.favicon != null && result.favicon!.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.network(
                result.favicon!,
                width: 14,
                height: 14,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _buildPlaceholder(textColor),
              ),
            )
          else
            _buildPlaceholder(textColor),
          const SizedBox(width: 5),
          Text(
            sourceName,
            style: TextStyle(
              color: textColor,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(Color color) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Icon(Icons.public, size: 10, color: color.withOpacity(0.5)),
    );
  }

  String _extractDomain(String url) {
    try {
      final uri = Uri.parse(url);
      var host = uri.host;
      if (host.startsWith('www.')) host = host.substring(4);
      final parts = host.split('.');
      return parts.isNotEmpty ? parts.first : host;
    } catch (_) {
      return S.current.source;
    }
  }
}

/// "+ N more" pill
class _MorePill extends StatelessWidget {
  const _MorePill({
    required this.count,
    required this.isDark,
    required this.onTap,
  });

  final int count;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? const Color(0xFF2C2C2E) : const Color(0xFFE8E8E8);
    final textColor =
        isDark ? Colors.white.withOpacity(0.6) : Colors.black.withOpacity(0.5);

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          S.current.plus_count_more(count),
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _OverflowItemsBottomSheet extends StatelessWidget {
  const _OverflowItemsBottomSheet({
    required this.title,
    required this.items,
    required this.isDark,
  });

  final String title;
  final List<dynamic> items;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? const Color(0xFF1C1C1E) : Colors.white;
    final textPrimary =
        isDark ? DesignSystem.textPrimaryDark : DesignSystem.textPrimaryLight;
    final textSecondary = isDark
        ? DesignSystem.textSecondaryDark
        : DesignSystem.textSecondaryLight;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(top: 8, bottom: 12),
              decoration: BoxDecoration(
                color: textSecondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              title,
              style: TextStyle(
                color: textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // List
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                if (item is String) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    leading: Icon(
                      Icons.search,
                      size: 20,
                      color: textSecondary,
                    ),
                    title: Text(
                      item,
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                } else if (item is AgentStepResult) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    leading: _SourcePill(result: item, isDark: isDark),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      item.url,
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageActions extends StatelessWidget {
  const _MessageActions({
    required this.message,
    required this.isDark,
    this.onRetry,
  });

  final String message;
  final bool isDark;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    if (onRetry != null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Row(
        children: [
          _ActionButton(
            icon: Icons.copy_rounded,
            isDark: isDark,
            onTap: () {
              Clipboard.setData(ClipboardData(text: message));
              HapticFeedback.lightImpact();
            },
          ),
          // const SizedBox(width: 12),
          // _ActionButton(
          //   icon: Icons.headphones,
          //   isDark: isDark,
          //   onTap: () {
          //     // Read aloud placeholder
          //     HapticFeedback.lightImpact();
          //   },
          // ),
          // // Share action removed due to missing dependency
          // // const SizedBox(width: 12),
          // // _ActionButton(
          // //   icon: Icons.ios_share_rounded,
          // //   isDark: isDark,
          // //   onTap: () {
          // //     HapticFeedback.lightImpact();
          // //   },
          // // ),
          // const Spacer(),
          // _ActionButton(
          //   icon: Icons.thumb_up_outlined,
          //   isDark: isDark,
          //   onTap: () {
          //     HapticFeedback.lightImpact();
          //   },
          // ),
          // const SizedBox(width: 12),
          // _ActionButton(
          //   icon: Icons.thumb_down_off_alt_rounded,
          //   isDark: isDark,
          //   onTap: () {
          //     HapticFeedback.lightImpact();
          //   },
          // ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.isDark,
    required this.onTap,
  });

  final IconData icon;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: 18,
          // Removed opacity for sharper look
          color: isDark
              ? DesignSystem.textSecondaryDark
              : DesignSystem.textSecondaryLight,
        ),
      ),
    );
  }
}

/// Custom Segmented Pill Switcher
class _ContentSwitcher extends StatelessWidget {
  final int selectedIndex;
  final bool isDark;
  final ValueChanged<int> onChanged;

  const _ContentSwitcher({
    super.key,
    required this.selectedIndex,
    required this.isDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF2F2F7);
    final selectedColor =
        isDark ? const Color(0xFF636366) : const Color(0xFFFFFFFF);
    final unselectedTextColor =
        isDark ? const Color(0xFF8E8E93) : const Color(0xFF8E8E93);
    final selectedTextColor = isDark ? Colors.white : Colors.black;

    return Container(
      height: 32,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.91),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildOption(
            index: 0,
            title: S.current.answer_tab,
            icon: Icons.align_horizontal_left_rounded,
            selectedColor: selectedColor,
            selectedTextColor: selectedTextColor,
            unselectedTextColor: unselectedTextColor,
          ),
          const SizedBox(width: 2),
          _buildOption(
            index: 1,
            title: S.current.images_tab,
            icon: Icons.image_outlined,
            selectedColor: selectedColor,
            selectedTextColor: selectedTextColor,
            unselectedTextColor: unselectedTextColor,
          ),
        ],
      ),
    );
  }

  Widget _buildOption({
    required int index,
    required String title,
    required IconData icon,
    required Color selectedColor,
    required Color selectedTextColor,
    required Color unselectedTextColor,
  }) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onChanged(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6.93),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(
              icon,
              size: 14,
              color: isSelected ? selectedTextColor : unselectedTextColor,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? selectedTextColor : unselectedTextColor,
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                letterSpacing: -0.08,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
