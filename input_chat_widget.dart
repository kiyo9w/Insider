// import 'dart:io';

// import 'package:app_settings/app_settings.dart';
// // import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:net_chat/core/themes/app_colors.dart';
// import 'package:net_chat/configs/app_config.dart';
// import 'package:net_chat/core/themes/app_themes.dart';
// import 'package:net_chat/features/chat/cubit/chatting_cubit.dart';
// import 'package:net_chat/features/chat/cubit/chatting_state.dart';
// import 'package:net_chat/generated/assets.gen.dart';
// import 'package:net_chat/generated/l10n.dart';
// import 'package:net_chat/utils/utils.dart';
// import 'package:vtnet_components/vtnet_components.dart';
// import 'package:net_chat/widgets/localized_widgets.dart';
// import 'package:path/path.dart' as path;
// import 'package:showcaseview/showcaseview.dart';
// import 'package:net_chat/features/first_time_guide/cubit/first_time_guide_cubit.dart';
// import 'package:net_chat/features/first_time_guide/widgets/showcase_keys.dart';
// import 'package:net_chat/features/first_time_guide/widgets/highlight_aura.dart';
// import 'package:go_router/go_router.dart';
// import 'package:net_chat/router/app_router.dart';
// import 'package:net_chat/features/personal_scripts/services/one_touch_service.dart';
// import 'package:net_chat/features/chat/view/quick_actions_menu.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class InputChatWidget extends StatefulWidget {
//   const InputChatWidget({
//     required this.inputController,
//     required this.scrollController,
//     required this.focusNode,
//     required this.sendButtonStatus,
//     required this.onSubmit,
//     required this.onStop,
//     required this.isEnabledSendButton,
//     required this.imageController,
//     this.isShowSelectImage = true,
//     this.onImageSelected,
//     this.isDarkMode = false,
//     this.isDeepThinkEnabled = false,
//     this.onToggleDeepThink,
//     this.showThinkButton = true,
//     this.inputEnabled = true, // ← mới
//     this.oneTouchQuestions,
//     this.showQuickActions = false, // ← new parameter for showing quick actions
//     super.key,
//   });

//   final TextEditingController inputController;
//   final ScrollController scrollController;
//   final FocusNode focusNode;
//   final ValueNotifier<SendButtonStatus> sendButtonStatus;
//   final VoidCallback onSubmit;
//   final VoidCallback onStop;
//   final bool isShowSelectImage;
//   final Function(String)? onImageSelected;
//   final ValueNotifier<bool> isEnabledSendButton;
//   final ValueNotifier<String> imageController;
//   final bool isDarkMode;
//   final bool isDeepThinkEnabled;
//   final VoidCallback? onToggleDeepThink;
//   final bool showThinkButton;
//   final bool inputEnabled; // ← mới
//   final List<String>?
//   oneTouchQuestions; // optional: when provided, show one-touch run-all button
//   final bool showQuickActions; // ← new parameter for showing quick actions menu

//   @override
//   State<InputChatWidget> createState() => _InputChatWidgetState();
// }

// class _InputChatWidgetState extends State<InputChatWidget>
//     with SingleTickerProviderStateMixin {
//   ThemeData get theme => Theme.of(context);

//   ThemeColorExtension? get themeColor => theme.extension<ThemeColorExtension>();

//   static const Color _lightRedAccent150 = Color(
//     0xFFFF6B6B,
//   ); // Changed to match button preference
//   late final AnimationController _oneTouchAnimController = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 1500),
//   );
//   bool _isOneTouchRunning = false;
//   bool _isOneTouchPaused = false;
//   String _oneTouchConversationIdAtStart = '';
//   String _lastConversationIdSnapshot = '';
//   FirstTimeGuideCubit? _cachedFirstTimeGuideCubit;

//   bool _hasShowCase(BuildContext context) {
//     try {
//       ShowCaseWidget.of(context);
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }

//   Future<void> _showIntroVideo() async {
//     // Extract video ID from URL
//     const String youtubeUrl = 'https://youtu.be/PVYPibXcgvk';
//     final String? videoId = YoutubePlayer.convertUrlToId(youtubeUrl);
//     if (videoId == null) {
//       Utils.showToast(toastType: ToastType.error, message: 'Invalid video');
//       return;
//     }
//     // Create controller fast; do NOT block UI with any network prefetch
//     final controller = YoutubePlayerController(
//       initialVideoId: videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: true,
//         controlsVisibleAtStart: false,
//         hideControls: true,
//         mute: false,
//         disableDragSeek: true,
//         enableCaption: false,
//         showLiveFullscreenButton: false,
//         useHybridComposition: true,
//         forceHD: true, // Force HD quality
//         startAt: 0,
//         loop: false,
//         isLive: false,
//         hideThumbnail: true,
//       ),
//     );

//     await showDialog<void>(
//       context: context,
//       barrierDismissible: true,
//       barrierColor: Colors.black.withValues(alpha: 0.9),
//       builder: (ctx) {
//         final bool isLandscape =
//             MediaQuery.of(ctx).orientation == Orientation.landscape;
//         final double maxWidth = Utils.getContentMaxWidth(ctx);
//         final double videoWidth =
//             isLandscape ? maxWidth * 0.7 : maxWidth * 0.92;
//         final double videoHeight = videoWidth * (9 / 16);
//         String thumbUrl =
//             'https://img.youtube.com/vi/'
//             '$videoId'
//             '/maxresdefault.jpg';

//         bool isReady = false;
//         bool hideOverlay = false;

//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Center(
//               child: Material(
//                 color: Colors.transparent,
//                 child: SizedBox(
//                   width: videoWidth,
//                   height: videoHeight,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16.r),
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         // Player (underneath)
//                         YoutubePlayer(
//                           controller: controller,
//                           showVideoProgressIndicator: false,
//                           progressIndicatorColor: Colors.transparent,
//                           bottomActions: const [],
//                           topActions: const [],
//                           onReady: () async {
//                             if (isReady) return;
//                             isReady = true;
//                             // Immediately hide overlay to remove YouTube branding
//                             if (context.mounted) {
//                               setState(() => hideOverlay = true);
//                             }
//                             // Force highest quality after player is ready
//                             try {
//                               // Reload the video to ensure HD quality is applied
//                               controller.load(videoId);
//                             } catch (_) {
//                               // If load fails, the player will use default quality
//                             }
//                           },
//                         ),
//                         // Instant thumbnail placeholder overlay
//                         if (!hideOverlay)
//                           Container(
//                             color: Colors.black,
//                             child: Stack(
//                               fit: StackFit.expand,
//                               children: [
//                                 Image.network(
//                                   thumbUrl,
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (c, e, s) {
//                                     return Image.network(
//                                       'https://img.youtube.com/vi/'
//                                       '$videoId'
//                                       '/hqdefault.jpg',
//                                       fit: BoxFit.cover,
//                                     );
//                                   },
//                                 ),
//                                 Container(
//                                   color: Colors.black.withValues(alpha: 0.3),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         // Close button inside video container (top-right)
//                         Positioned(
//                           top: 8.w,
//                           right: 8.w,
//                           child: IconButton(
//                             onPressed: () => Navigator.of(ctx).pop(),
//                             icon: Icon(
//                               Icons.close_rounded,
//                               size: 22.sp,
//                               color: Colors.white,
//                             ),
//                             style: IconButton.styleFrom(
//                               backgroundColor: Colors.black.withValues(
//                                 alpha: 0.28,
//                               ),
//                               padding: EdgeInsets.all(6.w),
//                               shape: const CircleBorder(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );

//     controller.pause();
//     controller.dispose();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     // Cache cubit references to avoid context.read during disposal
//     try {
//       _cachedFirstTimeGuideCubit = context.read<FirstTimeGuideCubit>();
//     } catch (_) {
//       _cachedFirstTimeGuideCubit = null;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     widget.inputController.addListener(_scrollToEndIfSttActive);
//   }

//   @override
//   void dispose() {
//     widget.inputController.removeListener(_scrollToEndIfSttActive);
//     _oneTouchAnimController.dispose();
//     super.dispose();
//   }

//   void _scrollToEndIfSttActive() {
//     if (!mounted) return;
//     final chattingCubit = context.read<ChattingCubit>();
//     final sttStatus = chattingCubit.state.sttStatus;

//     if (sttStatus == SttStatus.listening || sttStatus == SttStatus.connecting) {
//       if (widget.scrollController.hasClients) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           // Re-check hasClients as it might change between frames
//           if (mounted &&
//               widget.scrollController.hasClients &&
//               widget.scrollController.position.maxScrollExtent > 0.0) {
//             widget.scrollController.animateTo(
//               widget.scrollController.position.maxScrollExtent,
//               duration: const Duration(
//                 milliseconds: 150,
//               ), // A bit smoother animation
//               curve: Curves.easeOut,
//             );
//           }
//         });
//       }
//     }
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: source);
//     if (image != null) {
//       final file = File(image.path);
//       widget.onImageSelected?.call(file.path);
//     }
//   }

//   // _pickFile removed (unused)

//   bool _isImageFile(String filePath) {
//     final extension = path.extension(filePath).toLowerCase();
//     return [
//       '.jpg',
//       '.jpeg',
//       '.png',
//       '.gif',
//       '.bmp',
//       '.webp',
//     ].contains(extension);
//   }

//   String _getFileIcon(String filePath) {
//     final extension = path.extension(filePath).toLowerCase();
//     switch (extension) {
//       case '.pdf':
//         return 'pdf';
//       case '.doc':
//       case '.docx':
//         return 'doc';
//       case '.txt':
//       case '.rtf':
//         return 'txt';
//       case '.xls':
//       case '.xlsx':
//         return 'xls';
//       case '.ppt':
//       case '.pptx':
//         return 'ppt';
//       default:
//         return 'file';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Conversation change detector: promote baseline for new conversation ids during a running One Touch;
//     // only reset when conversation truly switches MID-RUN after baseline is set.
//     try {
//       final chattingCubit = context.read<ChattingCubit>();
//       final String currentConversationId = chattingCubit.conversationId;
//       if (_lastConversationIdSnapshot != currentConversationId) {
//         final String previousSnapshot = _lastConversationIdSnapshot;
//         _lastConversationIdSnapshot = currentConversationId;
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (!mounted) return;
//           if (_isOneTouchRunning) {
//             // New conversation initialized during first send: adopt it as baseline, keep running
//             if (_oneTouchConversationIdAtStart.isEmpty &&
//                 currentConversationId.isNotEmpty) {
//               setState(() {
//                 _oneTouchConversationIdAtStart = currentConversationId;
//               });
//               return;
//             }
//             // True mid-run switch (baseline is set and differs): reset
//             if (_oneTouchConversationIdAtStart.isNotEmpty &&
//                 currentConversationId.isNotEmpty &&
//                 currentConversationId != _oneTouchConversationIdAtStart) {
//               _oneTouchAnimController.stop();
//               setState(() {
//                 _isOneTouchRunning = false;
//                 _isOneTouchPaused = false;
//                 _oneTouchConversationIdAtStart = '';
//               });
//             }
//           } else {
//             // Not running: clear stale baseline when conversation changes
//             if (previousSnapshot != currentConversationId) {
//               setState(() {
//                 _oneTouchConversationIdAtStart = '';
//               });
//             }
//           }
//         });
//       }
//     } catch (_) {}

//     if (widget.isShowSelectImage && widget.onImageSelected == null) {
//       assert(false, 'onImageSelected is missing');
//     }

//     final Orientation orientation = MediaQuery.of(context).orientation;
//     final bool isLandscape = orientation == Orientation.landscape;

//     // Remove all landscape scaling - keep normal size
//     final double bottomMarginScale = 1.0;
//     final double textFieldVerticalPaddingScale = 1.0;
//     final double actionsRowTopPaddingScale = 1.0;
//     final double actionsRowBottomPaddingScale = 1.0;
//     final double buttonGapScale = 1.0;
//     final double generalIconScale = 1.0;
//     final double buttonSizeScale = 1.0;
//     final double textFieldFontSizeScale = 1.0;
//     final double deepThinkLabelFontSizeScale = 1.0;
//     final double deepThinkHPaddingScale = 1.0;
//     final double borderRadiusScale = 1.0;

//     // Check if both image and think buttons are hidden
//     final bool hasMinimalButtons =
//         !widget.isShowSelectImage && !widget.showThinkButton;

//     return BlocListener<ChattingCubit, ChattingState>(
//       listenWhen:
//           (previous, current) =>
//               previous.sttErrorMessage != current.sttErrorMessage,
//       listener: (context, state) {
//         if (state.sttErrorMessage != null &&
//             state.sttErrorMessage!.isNotEmpty) {
//           if (state.sttErrorMessage == 'permission_dialog_required') {
//             Utils.showBaseDialog(
//               context: context,
//               dialogType: DialogType.warning,
//               title: S.current.microphone_permission_dialog_title,
//               content: S.current.microphone_permission_dialog_content,
//               leftButtonTitle: S.current.cancel,
//               rightButtonTitle: S.current.settings,
//               onLeftButtonClick: () {
//                 Navigator.of(context).pop();
//                 context.read<ChattingCubit>().clearSttError();
//               },
//               onRightButtonClick: () {
//                 Navigator.of(context).pop();
//                 context.read<ChattingCubit>().clearSttError();
//                 Future.delayed(
//                   const Duration(milliseconds: 500),
//                   AppSettings.openAppSettings,
//                 );
//               },
//             );
//           } else {
//             Utils.showToast(
//               toastType: ToastType.error,
//               message: state.sttErrorMessage!,
//             );
//             context.read<ChattingCubit>().clearSttError();
//           }
//         }
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (widget.showQuickActions)
//             QuickActionsMenu(
//               isDarkMode: widget.isDarkMode,
//               isCompact: context.read<ChattingCubit>().messages.isNotEmpty,
//               onMeetingTap: () => _handleQuickAction('/meeting'),
//               onReminderTap: () => _handleQuickAction('/remind'),
//               onPersonalProfileTap: () {
//                 context.push(AppRouter.personalProfilePath);
//               },
//               onFeaturesNewTap:
//                   () => _handleQuickAction('netMind có tính năng gì mới'),
//               onReportsTap: () => _handleReportsAction(),
//               onOneTouchTap: () {
//                 context.push(AppRouter.personalScriptsPath);
//               },
//               onNewsletterTap: () {
//                 context.push(AppRouter.newsletterPath);
//               },
//               onIntroVideoTap: _showIntroVideo,
//             ),
//           Container(
//             margin: EdgeInsets.only(bottom: 16.h * bottomMarginScale),
//             padding: EdgeInsets.symmetric(horizontal: 16.w),
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return Container(
//                   width: constraints.maxWidth,
//                   decoration: BoxDecoration(
//                     color:
//                         widget.isDarkMode
//                             ? AppColors.surfaceNeutralMediumDark.withValues(
//                               alpha: 0.95,
//                             )
//                             : Colors.white,
//                     borderRadius: BorderRadius.circular(
//                       24.r * borderRadiusScale,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color:
//                             widget.isDarkMode
//                                 ? Colors.black26.withValues(alpha: 0.2)
//                                 : Colors.black.withValues(alpha: 0.08),
//                         blurRadius: 12,
//                         spreadRadius: 1,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                     border: Border.all(
//                       color:
//                           widget.isDarkMode
//                               ? Colors.grey.shade700
//                               : Colors.grey.shade400,
//                       width: 0.4,
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       ValueListenableBuilder<String>(
//                         valueListenable: widget.imageController,
//                         builder: (context, imagePath, child) {
//                           if (imagePath.isEmpty) {
//                             return const SizedBox.shrink();
//                           }

//                           final isImage = _isImageFile(imagePath);

//                           return Padding(
//                             padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 4.h),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Stack(
//                                 alignment: Alignment.topRight,
//                                 children: [
//                                   if (isImage)
//                                     // Image preview
//                                     ConstrainedBox(
//                                       constraints: BoxConstraints(
//                                         maxHeight: 120.h,
//                                         maxWidth: 140.w,
//                                       ),
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(
//                                           12.r,
//                                         ),
//                                         child: Image.file(
//                                           File(imagePath),
//                                           fit: BoxFit.contain,
//                                         ),
//                                       ),
//                                     )
//                                   else
//                                     // File preview
//                                     Container(
//                                       constraints: BoxConstraints(
//                                         maxWidth: 200.w,
//                                       ),
//                                       padding: EdgeInsets.all(12.r),
//                                       decoration: BoxDecoration(
//                                         color:
//                                             widget.isDarkMode
//                                                 ? Colors.grey.shade800
//                                                 : Colors.grey.shade100,
//                                         borderRadius: BorderRadius.circular(
//                                           12.r,
//                                         ),
//                                         border: Border.all(
//                                           color:
//                                               widget.isDarkMode
//                                                   ? Colors.grey.shade600
//                                                   : Colors.grey.shade300,
//                                           width: 1,
//                                         ),
//                                       ),
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           Icon(
//                                             Icons.insert_drive_file,
//                                             color:
//                                                 widget.isDarkMode
//                                                     ? Colors.white70
//                                                     : Colors.black54,
//                                             size: 24.sp,
//                                           ),
//                                           Gap(8.w),
//                                           Flexible(
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Text(
//                                                   path.basename(imagePath),
//                                                   style: theme
//                                                       .textTheme
//                                                       .bodySmall
//                                                       ?.copyWith(
//                                                         color:
//                                                             widget.isDarkMode
//                                                                 ? Colors.white70
//                                                                 : Colors
//                                                                     .black87,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                       ),
//                                                   maxLines: 1,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                 ),
//                                                 Text(
//                                                   _getFileIcon(
//                                                     imagePath,
//                                                   ).toUpperCase(),
//                                                   style: theme
//                                                       .textTheme
//                                                       .bodySmall
//                                                       ?.copyWith(
//                                                         color:
//                                                             widget.isDarkMode
//                                                                 ? Colors.white54
//                                                                 : Colors
//                                                                     .black54,
//                                                         fontSize: 10.sp,
//                                                       ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   Container(
//                                     margin: EdgeInsets.all(4.r),
//                                     decoration: BoxDecoration(
//                                       color: Colors.black.withValues(
//                                         alpha: 0.5,
//                                       ),
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: IconButton(
//                                       key: const Key('chat_clear_image_button'),
//                                       icon: Icon(
//                                         Icons.close,
//                                         color: Colors.white,
//                                         size: 18.sp,
//                                       ),
//                                       padding: EdgeInsets.zero,
//                                       constraints: const BoxConstraints(),
//                                       onPressed: () {
//                                         widget.imageController.value = '';
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       if (hasMinimalButtons)
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 8.w,
//                             right: 8.w,
//                             top: 4.h * textFieldVerticalPaddingScale,
//                             bottom: 4.h * textFieldVerticalPaddingScale,
//                           ),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: _buildButtonWithOptionalShowcase(
//                                   showcaseKey: textChatKey,
//                                   description: S.current.guideTextChat,
//                                   title: S.current.guideTitleInput,
//                                   child: TextField(
//                                     key: const Key('chat_text_field'),
//                                     focusNode: widget.focusNode,
//                                     controller: widget.inputController,
//                                     style: theme.textTheme.bodyLarge?.copyWith(
//                                       color:
//                                           widget.isDarkMode
//                                               ? Colors.white
//                                               : Colors.black87,
//                                       fontSize:
//                                           (theme
//                                                   .textTheme
//                                                   .bodyLarge
//                                                   ?.fontSize ??
//                                               16.0) *
//                                           textFieldFontSizeScale,
//                                     ),
//                                     decoration: InputDecoration(
//                                       hintText: S.current.input_hint(
//                                         S.current.question.toLowerCase(),
//                                       ),
//                                       hintStyle: theme.textTheme.bodyLarge
//                                           ?.copyWith(
//                                             color:
//                                                 widget.isDarkMode
//                                                     ? Colors.white60
//                                                     : Colors.black38,
//                                             fontSize:
//                                                 (theme
//                                                         .textTheme
//                                                         .bodyLarge
//                                                         ?.fontSize ??
//                                                     16.0) *
//                                                 textFieldFontSizeScale,
//                                           ),
//                                       border: InputBorder.none,
//                                       contentPadding: EdgeInsets.only(
//                                         top:
//                                             10.h *
//                                             textFieldVerticalPaddingScale,
//                                         bottom:
//                                             10.h *
//                                             textFieldVerticalPaddingScale,
//                                         right: 8.w,
//                                         left: 8.w,
//                                       ),
//                                       isDense: true,
//                                       fillColor: Colors.transparent,
//                                     ),
//                                     minLines: 1,
//                                     textInputAction: TextInputAction.newline,
//                                     keyboardType: TextInputType.multiline,
//                                     textCapitalization:
//                                         TextCapitalization.sentences,
//                                     enabled: widget.inputEnabled, // ← mới
//                                     readOnly: !widget.inputEnabled, // ← mới
//                                   ),
//                                 ),
//                               ),
//                               Gap(8.w * buttonGapScale),
//                               Row(
//                                 children: [
//                                   _buildMicrophoneButton(
//                                     generalIconScale,
//                                     buttonSizeScale,
//                                     borderRadiusScale,
//                                     isLandscape,
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 8.w * buttonGapScale,
//                                     ),
//                                     child: _buildOneTouchComposerButton(
//                                       generalIconScale,
//                                       buttonSizeScale,
//                                       borderRadiusScale,
//                                       isLandscape,
//                                     ),
//                                   ),
//                                   _buildSendButton(
//                                     generalIconScale,
//                                     buttonSizeScale,
//                                     borderRadiusScale,
//                                     isLandscape,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         )
//                       else
//                         Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.fromLTRB(
//                                 8.w,
//                                 16.h * textFieldVerticalPaddingScale,
//                                 8.w,
//                                 16.h * textFieldVerticalPaddingScale,
//                               ),
//                               child: _buildButtonWithOptionalShowcase(
//                                 showcaseKey: textChatKey,
//                                 description: S.current.guideTextChat,
//                                 title: S.current.input,
//                                 child: TextField(
//                                   key: const Key('chat_text_field'),
//                                   focusNode: widget.focusNode,
//                                   controller: widget.inputController,
//                                   style: theme.textTheme.bodyLarge?.copyWith(
//                                     color:
//                                         widget.isDarkMode
//                                             ? Colors.white
//                                             : Colors.black87,
//                                     fontSize:
//                                         (theme.textTheme.bodyLarge?.fontSize ??
//                                             16.0) *
//                                         textFieldFontSizeScale,
//                                   ),
//                                   decoration: InputDecoration(
//                                     hintText: S.current.input_hint(
//                                       S.current.question.toLowerCase(),
//                                     ),
//                                     hintStyle: theme.textTheme.bodyLarge
//                                         ?.copyWith(
//                                           color:
//                                               widget.isDarkMode
//                                                   ? Colors.white60
//                                                   : Colors.black38,
//                                           fontSize:
//                                               (theme
//                                                       .textTheme
//                                                       .bodyLarge
//                                                       ?.fontSize ??
//                                                   16.0) *
//                                               textFieldFontSizeScale,
//                                         ),
//                                     border: InputBorder.none,
//                                     contentPadding: EdgeInsets.only(
//                                       left: 8.w,
//                                       right: 8.w,
//                                     ),
//                                     isDense: true,
//                                     fillColor: Colors.transparent,
//                                   ),
//                                   maxLines:
//                                       orientation == Orientation.landscape
//                                           ? 3
//                                           : 5,
//                                   minLines: 1,
//                                   textInputAction: TextInputAction.newline,
//                                   keyboardType: TextInputType.multiline,
//                                   textCapitalization:
//                                       TextCapitalization.sentences,
//                                   enabled: widget.inputEnabled, // ← mới
//                                   readOnly: !widget.inputEnabled, // ← mới
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.fromLTRB(
//                                 8.w,
//                                 4.h * actionsRowTopPaddingScale,
//                                 8.w,
//                                 12.h * actionsRowBottomPaddingScale,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       _buildImageButton(
//                                         generalIconScale,
//                                         buttonSizeScale,
//                                         borderRadiusScale,
//                                         isLandscape,
//                                       ),
//                                       Gap(8.w * buttonGapScale),
//                                       // One Touch moved to the right action cluster
//                                       if (widget.showThinkButton)
//                                         _buildDeepThinkButton(
//                                           generalIconScale,
//                                           buttonSizeScale,
//                                           deepThinkLabelFontSizeScale,
//                                           deepThinkHPaddingScale,
//                                           borderRadiusScale,
//                                           isLandscape,
//                                         ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       _buildMicrophoneButton(
//                                         generalIconScale,
//                                         buttonSizeScale,
//                                         borderRadiusScale,
//                                         isLandscape,
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.symmetric(
//                                           horizontal: 8.w * buttonGapScale,
//                                         ),
//                                         child: _buildOneTouchComposerButton(
//                                           generalIconScale,
//                                           buttonSizeScale,
//                                           borderRadiusScale,
//                                           isLandscape,
//                                         ),
//                                       ),
//                                       _buildSendButton(
//                                         generalIconScale,
//                                         buttonSizeScale,
//                                         borderRadiusScale,
//                                         isLandscape,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Quick action handler method
//   void _handleQuickAction(String message) {
//     final chatCubit = context.read<ChattingCubit>();

//     // Check if send button is enabled before proceeding
//     if (chatCubit.sendButtonStatus.value != SendButtonStatus.enable) {
//       return;
//     }

//     // Hide keyboard
//     Utils.hideKeyboard();

//     // Set the message in the input controller
//     widget.inputController.text = message;
//     // Set flag if this is the meeting button
//     if (message == '/meeting') {
//       chatCubit.send();
//       chatCubit.setMeetingButtonPressed();
//       // Don't auto-send for meeting button - let user choose from suggestions
//       return;
//     }

//     // Send the message directly - same logic as suggestion taps
//     chatCubit.send();
//   }

//   // Reports action handler - navigates to reports screen
//   void _handleReportsAction() {
//     context.push(AppRouter.reportsPath);
//   }

//   Widget _buildImageButton(
//     double iconScale,
//     double btnSizeScale,
//     double radiusScale,
//     bool isLandscape,
//   ) {
//     if (!widget.isShowSelectImage) return const SizedBox();

//     return Material(
//       color: Colors.transparent,
//       child: Semantics(
//         label: 'chat_image_selection_button',
//         button: true,
//         child: LocalizedPopupMenu(
//           key: const Key('chat_image_selection_button'),
//           onTap: () {
//             if (widget.focusNode.hasFocus) {
//               Utils.hideKeyboard();
//             }
//           },
//           openDelay: const Duration(milliseconds: 200),
//           onMenuWhenOnTap: true,
//           items: [
//             MenuItem(
//               nameItem: S.current.photo,
//               icon: Icon(
//                 Icons.photo_outlined,
//                 size: AppThemes.getIconSizeSmall(context) * iconScale,
//                 color: themeColor?.iconColorDefault,
//               ),
//               onPressed: () {
//                 _pickImage(ImageSource.gallery);
//               },
//             ),
//             MenuItem(
//               nameItem: S.current.camera,
//               icon: Icon(
//                 Icons.camera_alt_outlined,
//                 size: AppThemes.getIconSizeSmall(context) * iconScale,
//                 color: themeColor?.iconColorDefault,
//               ),
//               onPressed: () {
//                 _pickImage(ImageSource.camera);
//               },
//             ),
//             MenuItem(
//               nameItem: S.current.file,
//               icon: Icon(
//                 Icons.insert_drive_file_outlined,
//                 size: AppThemes.getIconSizeSmall(context) * iconScale,
//                 color: themeColor?.iconColorDefault,
//               ),
//               onPressed: () {
//                 context.read<ChattingCubit>().pickFile();
//               },
//             ),
//           ],
//           child: Semantics(
//             label: 'chat_image_selection_button',
//             button: true,
//             child: _buildButtonWithOptionalShowcase(
//               showcaseKey: attachedPhotoKey,
//               description: S.current.guidePhoto,
//               title: S.current.guideTitlePhoto,
//               child: _buildActionButton(
//                 icon: Assets.icons.icBulkGallery.svg(
//                   width: AppThemes.getIconSizeSmall(context) * iconScale,
//                   height: AppThemes.getIconSizeSmall(context) * iconScale,
//                   colorFilter: ColorFilter.mode(
//                     widget.isDarkMode ? Colors.white70 : Colors.black45,
//                     BlendMode.srcIn,
//                   ),
//                 ),
//                 iconScale: iconScale,
//                 btnSizeScale: btnSizeScale,
//                 radiusScale: radiusScale,
//                 isLandscape: isLandscape,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildActionButton({
//     required Widget icon,
//     required double iconScale,
//     required double btnSizeScale,
//     required double radiusScale,
//     required bool isLandscape,
//     VoidCallback? onTap,
//     bool isActive = false,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(20.r * radiusScale),
//       child: Container(
//         height: AppThemes.getButtonSize(context) * btnSizeScale,
//         width: AppThemes.getButtonSize(context) * btnSizeScale,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.r * radiusScale),
//           color:
//               isActive
//                   ? (widget.isDarkMode
//                       ? Colors.white.withValues(alpha: 0.15)
//                       : Colors.grey.shade200)
//                   : Colors.transparent,
//           border: Border.all(
//             color:
//                 isActive
//                     ? (widget.isDarkMode ? Colors.white70 : Colors.black45)
//                     : (widget.isDarkMode
//                         ? Colors.grey.shade600
//                         : Colors.grey.shade400),
//             width: 1.5,
//           ),
//         ),
//         child: Center(child: icon),
//       ),
//     );
//   }

//   Widget _buildDeepThinkButton(
//     double iconScale,
//     double btnSizeScale,
//     double labelFontScale,
//     double hPaddingScale,
//     double radiusScale,
//     bool isLandscape,
//   ) {
//     final deepThinkCore = Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Material(
//           color: Colors.transparent,
//           child: Semantics(
//             label: 'chat_deep_think_toggle_button',
//             button: true,
//             child: InkWell(
//               key: const Key('chat_deep_think_toggle_button'),
//               borderRadius: BorderRadius.circular(18.r * radiusScale),
//               onTap: () {
//                 if (widget.onToggleDeepThink != null) {
//                   widget.onToggleDeepThink!();
//                 }
//               },
//               child: AnimatedContainer(
//                 duration: Durations.short3,
//                 curve: Curves.easeInOut,
//                 height: AppThemes.getButtonSize(context) * btnSizeScale,
//                 padding: EdgeInsets.symmetric(horizontal: 16.w * hPaddingScale),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.r * radiusScale),
//                   color:
//                       widget.isDeepThinkEnabled
//                           ? _lightRedAccent150.withValues(alpha: 0.1)
//                           : Colors.transparent,
//                   border: Border.all(
//                     color:
//                         widget.isDeepThinkEnabled
//                             ? _lightRedAccent150
//                             : widget.isDarkMode
//                             ? Colors.grey.shade600
//                             : Colors.grey.shade400,
//                     width: 1.5,
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AnimatedSwitcher(
//                       duration: Durations.medium2,
//                       child:
//                           widget.isDeepThinkEnabled
//                               ? Assets.icons.icLineAtom.svg(
//                                 key: const ValueKey('deep_think_icon'),
//                                 width:
//                                     AppThemes.getIconSizeSmall(context) *
//                                     iconScale,
//                                 height:
//                                     AppThemes.getIconSizeSmall(context) *
//                                     iconScale,
//                                 colorFilter: const ColorFilter.mode(
//                                   _lightRedAccent150,
//                                   BlendMode.srcIn,
//                                 ),
//                               )
//                               : Assets.icons.icLineAtom.svg(
//                                 key: const ValueKey('search_icon'),
//                                 width:
//                                     AppThemes.getIconSizeSmall(context) *
//                                     iconScale,
//                                 height:
//                                     AppThemes.getIconSizeSmall(context) *
//                                     iconScale,
//                                 colorFilter: ColorFilter.mode(
//                                   widget.isDarkMode
//                                       ? Colors.white70
//                                       : Colors.black45,
//                                   BlendMode.srcIn,
//                                 ),
//                               ),
//                     ),
//                     Gap(4.w),
//                     AnimatedSwitcher(
//                       duration: Durations.medium2,
//                       child: Text(
//                         widget.isDeepThinkEnabled
//                             ? S.current.deep_think
//                             : S.current.think,
//                         key: ValueKey(
//                           widget.isDeepThinkEnabled
//                               ? 'deep_think_text'
//                               : 'think_text',
//                         ),
//                         style: theme.textTheme.bodyMedium?.copyWith(
//                           fontWeight: FontWeight.w600,
//                           fontSize:
//                               (theme.textTheme.labelMedium?.fontSize ?? 14.0) *
//                               labelFontScale,
//                           color:
//                               widget.isDeepThinkEnabled
//                                   ? _lightRedAccent150
//                                   : widget.isDarkMode
//                                   ? Colors.white70
//                                   : Colors.black54,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );

//     // Wrap with Showcase for THINKING step
//     return _buildButtonWithOptionalShowcase(
//       showcaseKey: thinkingKey,
//       description: S.current.guideThinking,
//       title: S.current.guideTitleThinking,
//       child: deepThinkCore,
//     );
//   }

//   // Removed unused legacy One Touch button implementation

//   Widget _buildOneTouchComposerButton(
//     double iconScale,
//     double btnSizeScale,
//     double radiusScale,
//     bool isLandscape,
//   ) {
//     return _buildButtonWithOptionalShowcase(
//       showcaseKey: oneTouchRunKey,
//       description: S.current.guideOneTouchRun,
//       title: S.current.guideTitleOneTouchRun,
//       child: Semantics(
//         label: 'chat_one_touch_button',
//         button: true,
//         child: InkWell(
//           onTap: () async {
//             final chatCubit = context.read<ChattingCubit>();
//             // If already running but conversation changed, reset state and start fresh
//             if (_isOneTouchRunning &&
//                 chatCubit.conversationId != _oneTouchConversationIdAtStart) {
//               setState(() {
//                 _isOneTouchRunning = false;
//                 _isOneTouchPaused = false;
//                 _oneTouchConversationIdAtStart = '';
//               });
//             }
//             // If already running in the same conversation, toggle pause/resume
//             if (_isOneTouchRunning) {
//               setState(() {
//                 _isOneTouchPaused = !_isOneTouchPaused;
//               });
//               return;
//             }
//             // Always fetch the latest questions from server to avoid stale cache
//             List<String> questions = const <String>[];
//             try {
//               final data = await OneTouchService().load();
//               questions =
//                   data.questions
//                       .map((e) => e.trim())
//                       .where((e) => e.isNotEmpty)
//                       .toList();
//             } catch (_) {
//               // Fallback to provided list if service fails
//               questions =
//                   (widget.oneTouchQuestions ?? const <String>[])
//                       .map((e) => e.trim())
//                       .where((e) => e.isNotEmpty)
//                       .toList();
//             }
//             if (questions.isEmpty) {
//               final proceed = await showDialog<bool>(
//                 context: context,
//                 builder: (ctx) {
//                   return LocalizedBaseDialog(
//                     dialogType: DialogType.info,
//                     title: S.current.oneTouchSetupPromptTitle,
//                     content: S.current.oneTouchSetupPromptBody,
//                     leftButtonTitle: S.current.cancel,
//                     rightButtonTitle: S.current.oneTouchOpen,
//                     onLeftButtonClick: () => Navigator.of(ctx).pop(false),
//                     onRightButtonClick: () => Navigator.of(ctx).pop(true),
//                   );
//                 },
//               );
//               if (proceed == true) {
//                 if (mounted) {
//                   context.push(AppRouter.personalScriptsPath);
//                 }
//               }
//               return;
//             }
//             final proceed = await showDialog<bool>(
//               context: context,
//               builder: (ctx) {
//                 return LocalizedBaseDialog(
//                   dialogType: DialogType.confirm,
//                   title: S.current.oneTouchRunAllConfirmTitle,
//                   content: S.current.oneTouchRunAllConfirmBody(
//                     questions.length,
//                   ),
//                   leftButtonTitle: S.current.cancel,
//                   rightButtonTitle: S.current.confirm,
//                   onLeftButtonClick: () => Navigator.of(ctx).pop(false),
//                   onRightButtonClick: () => Navigator.of(ctx).pop(true),
//                 );
//               },
//             );
//             if (proceed != true) return;

//             if (chatCubit.sendButtonStatus.value != SendButtonStatus.enable) {
//               return; // avoid overlapping
//             }
//             setState(() {
//               _isOneTouchRunning = true;
//               _isOneTouchPaused = false;
//               _oneTouchConversationIdAtStart = chatCubit.conversationId;
//             });
//             _oneTouchAnimController
//               ..reset()
//               ..repeat(reverse: true);
//             try {
//               for (final raw in questions) {
//                 if (!mounted) break;
//                 // Update baseline once a new conversationId is assigned (first send in new chat)
//                 if (_oneTouchConversationIdAtStart.isEmpty &&
//                     chatCubit.conversationId.isNotEmpty) {
//                   _oneTouchConversationIdAtStart = chatCubit.conversationId;
//                 }
//                 // Stop if conversation switched while running (after baseline set)
//                 if (chatCubit.conversationId !=
//                     _oneTouchConversationIdAtStart) {
//                   break;
//                 }
//                 final q = raw.trim();
//                 if (q.isEmpty) continue;

//                 final sanitized =
//                     q.length > ChattingCubit.maxQuestionLength
//                         ? q.substring(0, ChattingCubit.maxQuestionLength)
//                         : q;
//                 chatCubit.inputController.text = sanitized;
//                 chatCubit.isEnabledSendButton.value = true;
//                 await Future<void>.delayed(const Duration(milliseconds: 50));
//                 await chatCubit.send(waitForAnswer: true);
//                 if (chatCubit.lastSendWasStopped) {
//                   break;
//                 }
//                 // If user paused during the send, wait here before starting next question
//                 while (_isOneTouchPaused &&
//                     mounted &&
//                     chatCubit.conversationId ==
//                         _oneTouchConversationIdAtStart) {
//                   await Future<void>.delayed(const Duration(milliseconds: 120));
//                 }
//                 // Update baseline after first send if it was empty (new conversation case)
//                 if (_oneTouchConversationIdAtStart.isEmpty &&
//                     chatCubit.conversationId.isNotEmpty) {
//                   _oneTouchConversationIdAtStart = chatCubit.conversationId;
//                 }
//                 if (!mounted ||
//                     chatCubit.conversationId !=
//                         _oneTouchConversationIdAtStart) {
//                   break;
//                 }
//                 await Future<void>.delayed(const Duration(milliseconds: 150));
//               }
//             } finally {
//               if (mounted) {
//                 setState(() {
//                   _isOneTouchRunning = false;
//                   _isOneTouchPaused = false;
//                   _oneTouchConversationIdAtStart = '';
//                 });
//               }
//               _oneTouchAnimController.stop();
//             }
//           },
//           borderRadius: BorderRadius.circular(22.r * radiusScale),
//           child: AnimatedBuilder(
//             animation: _oneTouchAnimController,
//             builder: (context, child) {
//               // Unified styling: always black background, white icon in all themes
//               final Color baseFill = Colors.black;
//               final Color iconColor = Colors.white;
//               final double pulse =
//                   (_isOneTouchRunning && !_isOneTouchPaused)
//                       ? (0.2 + 0.2 * (_oneTouchAnimController.value))
//                       : 0.0;
//               return Container(
//                 width: AppThemes.getButtonSize(context) * btnSizeScale,
//                 height: AppThemes.getButtonSize(context) * btnSizeScale,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: baseFill,
//                   border: Border.all(
//                     color:
//                         widget.isDarkMode
//                             ? Colors.grey.shade600
//                             : Colors.grey.shade400,
//                     width: 1.5,
//                   ),
//                   boxShadow:
//                       (_isOneTouchRunning && !_isOneTouchPaused)
//                           ? [
//                             BoxShadow(
//                               color: Colors.black.withValues(alpha: pulse),
//                               blurRadius: 12.r,
//                               spreadRadius: 2.r,
//                             ),
//                           ]
//                           : null,
//                 ),
//                 child: Center(
//                   child:
//                       (_isOneTouchRunning && !_isOneTouchPaused)
//                           ? Icon(
//                             Icons.pause_rounded,
//                             size:
//                                 AppThemes.getIconSizeSmall(context) * iconScale,
//                             color: iconColor,
//                           )
//                           : Icon(
//                             Icons.play_arrow_rounded,
//                             size:
//                                 AppThemes.getIconSizeSmall(context) * iconScale,
//                             color: iconColor,
//                           ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   // Removed custom dashed pause icon to use Flutter's native pause icon for simplicity

//   Widget _buildSendButton(
//     double iconScale,
//     double btnSizeScale,
//     double radiusScale,
//     bool isLandscape,
//   ) {
//     return ValueListenableBuilder(
//       valueListenable: widget.inputController,
//       builder: (
//         BuildContext context,
//         TextEditingValue inputValue,
//         Widget? child,
//       ) {
//         return ValueListenableBuilder<SendButtonStatus>(
//           valueListenable: widget.sendButtonStatus,
//           builder: (
//             BuildContext context,
//             SendButtonStatus sendButtonStatus,
//             Widget? child,
//           ) {
//             return ValueListenableBuilder<bool>(
//               valueListenable: widget.isEnabledSendButton,
//               builder: (
//                 BuildContext context,
//                 bool isEnabledSendButton,
//                 Widget? child,
//               ) {
//                 final showSendIcon =
//                     sendButtonStatus != SendButtonStatus.showStop &&
//                     sendButtonStatus != SendButtonStatus.showStopDisable;

//                 // During the first-time guide, keep the send button enabled for demonstration
//                 final bool isShowcaseActive =
//                     (() {
//                       try {
//                         return ShowCaseWidget.activeTargetWidget(context) !=
//                             null;
//                       } catch (_) {
//                         return false;
//                       }
//                     })();
//                 final buttonEnabled =
//                     isShowcaseActive ||
//                     ((showSendIcon &&
//                             (isEnabledSendButton ||
//                                 inputValue.text.trim().isNotEmpty)) ||
//                         sendButtonStatus == SendButtonStatus.showStop);

//                 final Widget sendWidget = Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     key: const Key('chat_send_message_button'),
//                     borderRadius: BorderRadius.circular(20.r * radiusScale),
//                     onTap:
//                         buttonEnabled
//                             ? () {
//                               if (sendButtonStatus ==
//                                   SendButtonStatus.showStop) {
//                                 widget.onStop();
//                               } else {
//                                 if (widget.focusNode.hasFocus) {
//                                   Utils.hideKeyboard();
//                                 }
//                                 widget.onSubmit();
//                                 // After sending, scroll to bottom using cubit helper
//                                 WidgetsBinding.instance.addPostFrameCallback((
//                                   _,
//                                 ) {
//                                   if (!mounted) return;
//                                   context
//                                       .read<ChattingCubit>()
//                                       .scrollChatToBottom();
//                                 });
//                               }
//                             }
//                             : null,
//                     child: Semantics(
//                       label: 'chat_send_message_button',
//                       button: true,
//                       child: AnimatedContainer(
//                         duration: Durations.short2,
//                         width: AppThemes.getButtonSize(context) * btnSizeScale,
//                         height: AppThemes.getButtonSize(context) * btnSizeScale,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color:
//                               buttonEnabled
//                                   ? Colors.red
//                                   : (themeColor?.iconColorDisable ??
//                                       AppColors.iconColorDisable),
//                         ),
//                         child: Center(
//                           child:
//                               showSendIcon
//                                   ? Icon(
//                                     Icons.send_rounded,
//                                     size:
//                                         AppThemes.getIconSizeSmall(context) *
//                                         iconScale,
//                                     color: Colors.white,
//                                   )
//                                   : Icon(
//                                     Icons.stop_circle_outlined,
//                                     size:
//                                         AppThemes.getIconSizeSmall(context) *
//                                         iconScale,
//                                     color:
//                                         sendButtonStatus ==
//                                                 SendButtonStatus.showStopDisable
//                                             ? themeColor!.iconColorDisable
//                                             : Colors.white,
//                                   ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );

//                 return _buildButtonWithOptionalShowcase(
//                   showcaseKey: sendMessageKey,
//                   description: S.current.guideBtnSend,
//                   title: S.current.guideTitleSend,
//                   child: sendWidget,
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _buildMicrophoneButton(
//     double iconScale,
//     double btnSizeScale,
//     double radiusScale,
//     bool isLandscape,
//   ) {
//     // Hide microphone entirely if voice is disabled in config
//     if (!AppConfig.enableVoiceInput) {
//       return const SizedBox.shrink();
//     }
//     final chatCubit = context.read<ChattingCubit>();
//     // Additionally hide microphone if current bot does not allow TTS/ASR
//     if (!(chatCubit.selectedBot.isAllowedTtsAsr ?? false)) {
//       return const SizedBox.shrink();
//     }
//     return _buildButtonWithOptionalShowcase(
//       showcaseKey: voiceKey,
//       description: S.current.guideVoice,
//       title: S.current.guideTitleVoice,
//       child: Semantics(
//         label: 'chat_voice_recording_button',
//         button: true,
//         child: BlocBuilder<ChattingCubit, ChattingState>(
//           bloc: chatCubit,
//           buildWhen:
//               (previous, current) => previous.sttStatus != current.sttStatus,
//           builder: (context, state) {
//             IconData micIconData = Icons.mic_none_rounded;
//             Color micIconColor =
//                 widget.isDarkMode ? Colors.white70 : Colors.black45;
//             Color micBorderColor =
//                 widget.isDarkMode ? Colors.grey.shade600 : Colors.grey.shade400;
//             Color micBackgroundColor = Colors.transparent;
//             // bool isAnimated = false; // unused
//             bool showPulse = false;

//             switch (state.sttStatus) {
//               case SttStatus.connecting:
//                 micIconData = Icons.graphic_eq_rounded;
//                 micIconColor = _lightRedAccent150;
//                 micBorderColor = _lightRedAccent150;
//                 micBackgroundColor = _lightRedAccent150.withValues(alpha: 0.15);
//                 // isAnimated = true;
//                 break;
//               case SttStatus.listening:
//                 micIconData = Icons.stop_rounded;
//                 micIconColor = Colors.white;
//                 micBorderColor = _lightRedAccent150;
//                 micBackgroundColor = _lightRedAccent150;
//                 // isAnimated = true;
//                 showPulse = true;
//                 break;
//               case SttStatus.stopping:
//                 micIconData = Icons.mic_off_rounded;
//                 micIconColor = _lightRedAccent150;
//                 micBorderColor = _lightRedAccent150;
//                 micBackgroundColor = _lightRedAccent150.withValues(alpha: 0.15);
//                 break;
//               case SttStatus.error:
//                 micIconData = Icons.error_outline_rounded;
//                 micIconColor = Colors.red.shade600;
//                 micBorderColor = Colors.red.shade400;
//                 micBackgroundColor = Colors.red.withValues(alpha: 0.15);
//                 break;
//               case SttStatus.permissionDenied:
//                 micIconData = Icons.mic_off_rounded;
//                 micIconColor =
//                     widget.isDarkMode
//                         ? Colors.red.shade300
//                         : Colors.red.shade700;
//                 micBorderColor =
//                     widget.isDarkMode
//                         ? Colors.red.shade600
//                         : Colors.red.shade500;
//                 micBackgroundColor = Colors.red.withValues(alpha: 0.15);
//                 break;
//               case SttStatus.idle:
//                 micIconData = Icons.mic_rounded;
//                 micIconColor =
//                     widget.isDarkMode ? Colors.white70 : Colors.black45;
//                 micBorderColor =
//                     widget.isDarkMode
//                         ? Colors.grey.shade600
//                         : Colors.grey.shade400;
//                 micBackgroundColor = Colors.transparent;
//                 break;
//             }

//             return Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 key: const Key('chat_voice_recording_button'),
//                 borderRadius: BorderRadius.circular(22.r * radiusScale),
//                 onTap: () {
//                   HapticFeedback.lightImpact();
//                   chatCubit.toggleSttRecording();
//                 },
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 400),
//                   curve: Curves.easeInOut,
//                   width: AppThemes.getButtonSize(context) * btnSizeScale,
//                   height: AppThemes.getButtonSize(context) * btnSizeScale,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(22.r * radiusScale),
//                     color: micBackgroundColor,
//                     border: Border.all(
//                       color: micBorderColor,
//                       width: state.sttStatus == SttStatus.listening ? 2.5 : 1.5,
//                     ),
//                     boxShadow:
//                         showPulse
//                             ? [
//                               BoxShadow(
//                                 color: _lightRedAccent150.withValues(
//                                   alpha: 0.4,
//                                 ),
//                                 blurRadius: 12.r,
//                                 spreadRadius: 4.r,
//                               ),
//                             ]
//                             : state.sttStatus == SttStatus.connecting
//                             ? [
//                               BoxShadow(
//                                 color: _lightRedAccent150.withValues(
//                                   alpha: 0.2,
//                                 ),
//                                 blurRadius: 6.r,
//                                 spreadRadius: 1.r,
//                               ),
//                             ]
//                             : null,
//                   ),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       // Animated pulse effect for listening state
//                       if (showPulse)
//                         TweenAnimationBuilder<double>(
//                           duration: const Duration(milliseconds: 1500),
//                           tween: Tween(begin: 0.8, end: 1.2),
//                           builder: (context, scale, child) {
//                             return Transform.scale(
//                               scale: scale,
//                               child: Container(
//                                 width:
//                                     AppThemes.getButtonSize(context) *
//                                     btnSizeScale *
//                                     0.6,
//                                 height:
//                                     AppThemes.getButtonSize(context) *
//                                     btnSizeScale *
//                                     0.6,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     color: _lightRedAccent150.withValues(
//                                       alpha: 0.3,
//                                     ),
//                                     width: 2,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                           onEnd: () {
//                             // Restart animation if still listening
//                             if (state.sttStatus == SttStatus.listening) {
//                               // Animation will restart automatically
//                             }
//                           },
//                         ),
//                       // Main icon
//                       AnimatedSwitcher(
//                         duration: const Duration(milliseconds: 300),
//                         transitionBuilder: (child, animation) {
//                           return ScaleTransition(
//                             scale: animation,
//                             child: FadeTransition(
//                               opacity: animation,
//                               child: child,
//                             ),
//                           );
//                         },
//                         child:
//                             state.sttStatus == SttStatus.connecting
//                                 ? SizedBox(
//                                   key: const ValueKey('connecting'),
//                                   width:
//                                       AppThemes.getIconSizeSmall(context) *
//                                       iconScale,
//                                   height:
//                                       AppThemes.getIconSizeSmall(context) *
//                                       iconScale,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2.5,
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                       micIconColor,
//                                     ),
//                                     backgroundColor: micIconColor.withValues(
//                                       alpha: 0.2,
//                                     ),
//                                   ),
//                                 )
//                                 : Icon(
//                                   micIconData,
//                                   key: ValueKey(state.sttStatus),
//                                   size:
//                                       AppThemes.getIconSizeSmall(context) *
//                                       iconScale,
//                                   color: micIconColor,
//                                 ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildButtonWithOptionalShowcase({
//     required GlobalKey showcaseKey,
//     required String description,
//     String? title,
//     required Widget child,
//   }) {
//     if (!_hasShowCase(context)) return child;
//     // Responsive tooltip sizing for tablets/landscape
//     final bool isTablet = Utils.isTablet(context);
//     final bool isLandscape =
//         MediaQuery.of(context).orientation == Orientation.landscape;
//     final double tooltipHeight = isTablet ? 110.h : 88.h;
//     final double tooltipWidth =
//         isTablet
//             ? (isLandscape ? 420.w : 440.w)
//             : (isLandscape ? 340.w : 320.w);
//     // Choose tooltip position and target shape based on anchor
//     final bool placeTop =
//         showcaseKey == textChatKey ||
//         showcaseKey == attachedPhotoKey ||
//         showcaseKey == voiceKey ||
//         showcaseKey == thinkingKey ||
//         showcaseKey == oneTouchRunKey ||
//         showcaseKey == sendMessageKey;
//     final TooltipPosition position =
//         placeTop ? TooltipPosition.top : TooltipPosition.bottom;
//     final ShapeBorder? shapeBorder =
//         (showcaseKey == voiceKey || showcaseKey == sendMessageKey)
//             ? const CircleBorder()
//             : null;

//     // Build tooltip; tapping the tooltip content advances (or finishes on last step)
//     return Showcase.withWidget(
//       key: showcaseKey,
//       height: tooltipHeight,
//       width: tooltipWidth,
//       container: _buildSimpleTooltip(
//         description,
//         position: position,
//         showcaseKey: showcaseKey,
//         title: title,
//       ),
//       tooltipPosition: position,
//       targetShapeBorder: shapeBorder ?? const RoundedRectangleBorder(),
//       targetBorderRadius:
//           shapeBorder == null ? BorderRadius.circular(12.r) : null,
//       targetPadding: EdgeInsets.all(8.w),
//       tooltipActions: [
//         TooltipActionButton.custom(
//           button: _buildNextOrStartButton(showcaseKey),
//         ),
//       ],
//       tooltipActionConfig: TooltipActionConfig(
//         alignment: MainAxisAlignment.end,
//         position: TooltipActionPosition.outside,
//         gapBetweenContentAndAction: 8,
//       ),
//       child: HighlightAura(
//         showcaseKey: showcaseKey,
//         isCircular: showcaseKey == voiceKey || showcaseKey == sendMessageKey,
//         borderRadius:
//             showcaseKey == thinkingKey
//                 ? 20.r
//                 : showcaseKey == textChatKey
//                 ? 12.r
//                 : null,
//         child: child,
//       ),
//     );
//   }

//   Widget _buildNextOrStartButton(GlobalKey currentKey) {
//     final theme = Theme.of(context);
//     final colorTheme = theme.extension<ThemeColorExtension>();
//     final bool isLast = currentKey == sendMessageKey;
//     return InkWell(
//       onTap: () {
//         try {
//           if (isLast) {
//             ShowCaseWidget.of(context).dismiss();
//             _cachedFirstTimeGuideCubit?.completeGuide();
//           } else {
//             ShowCaseWidget.of(context).next();
//           }
//         } catch (_) {}
//       },
//       borderRadius: BorderRadius.circular(48.r),
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
//         decoration: BoxDecoration(
//           color:
//               colorTheme?.surfacePrimaryDefaultActive ??
//               theme.colorScheme.primary,
//           borderRadius: BorderRadius.circular(48.r),
//         ),
//         child: Text(
//           isLast ? S.current.start : S.current.continuee,
//           textAlign: TextAlign.center,
//           style: theme.textTheme.bodyMedium?.copyWith(
//             fontWeight: FontWeight.w500,
//             color: colorTheme?.textColorOnColor ?? Colors.white,
//             fontSize: 14.sp,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSimpleTooltip(
//     String description, {
//     TooltipPosition position = TooltipPosition.bottom,
//     GlobalKey? showcaseKey,
//     String? title,
//   }) {
//     final theme = Theme.of(context);
//     final colorTheme = theme.extension<ThemeColorExtension>();
//     int _ordinal(GlobalKey? key) {
//       if (key == exploreKey) return 1;
//       // if (key == notificationKey) return 2; // Hidden in production
//       if (key == oneTouchKey) return 2; // Moved up from 3
//       if (key == attachedPhotoKey) return 3; // Moved up from 4
//       if (key == voiceKey) return 4; // Moved up from 5
//       if (key == thinkingKey) return 5; // Moved up from 6
//       if (key == textChatKey) return 6; // Moved up from 7
//       if (key == sendMessageKey) return 7; // Moved up from 8
//       return 0;
//     }

//     final int ord = _ordinal(showcaseKey);
//     const int total = 7;
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         GestureDetector(
//           behavior: HitTestBehavior.translucent,
//           onTap: () {
//             try {
//               final bool isLast = showcaseKey == sendMessageKey;
//               if (isLast) {
//                 ShowCaseWidget.of(context).dismiss();
//                 _cachedFirstTimeGuideCubit?.completeGuide();
//               } else {
//                 ShowCaseWidget.of(context).next();
//               }
//             } catch (_) {}
//           },
//           child: Container(
//             padding: EdgeInsets.all(12.w),
//             decoration: BoxDecoration(
//               color: colorTheme?.surfaceNeutralDefaultRest ?? Colors.white,
//               borderRadius: BorderRadius.circular(12.r),
//               border: Border.all(
//                 color: colorTheme?.lineColorMedium ?? Colors.black12,
//                 width: 1,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.06),
//                   blurRadius: 8.r,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (ord > 0)
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 6.h),
//                     child: Text(
//                       '$ord/$total',
//                       style: theme.textTheme.bodySmall?.copyWith(
//                         color: colorTheme?.textColorMedium,
//                       ),
//                     ),
//                   ),
//                 if (title != null &&
//                     title.isNotEmpty &&
//                     title.trim() != description.trim())
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 6.h),
//                     child: Text(
//                       title,
//                       style: theme.textTheme.titleSmall?.copyWith(
//                         color: colorTheme?.textColorDefault,
//                         fontWeight: FontWeight.w700,
//                         fontSize: 16.sp,
//                       ),
//                     ),
//                   ),
//                 Text(
//                   description,
//                   textAlign: TextAlign.left,
//                   style: theme.textTheme.bodyMedium?.copyWith(
//                     color: colorTheme?.textColorDefault,
//                     fontSize: 14.sp,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           top: -28.h,
//           left: -18.w,
//           child: Assets.icons.icHello.svg(width: 48.w, height: 48.w),
//         ),
//         Positioned(
//           top: -5.h,
//           right: -5.w,
//           child: InkWell(
//             onTap: () {
//               try {
//                 ShowCaseWidget.of(context).dismiss();
//               } catch (_) {}
//             },
//             child: Assets.icons.icLineCross.svg(
//               width: 14.w,
//               height: 14.w,
//               colorFilter: ColorFilter.mode(
//                 Theme.of(context).brightness == Brightness.dark
//                     ? Colors.white
//                     : Colors.black,
//                 BlendMode.srcIn,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   bool get isLandscape =>
//       MediaQuery.of(context).orientation == Orientation.landscape;
// }
