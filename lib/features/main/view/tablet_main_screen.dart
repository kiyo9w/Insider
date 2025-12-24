import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/core/design_system/design_system.dart';
import 'package:insider/features/chat/data/models/chat_models.dart';
import 'package:insider/features/chat/view/chat_view.dart';
import 'package:insider/features/chat/view/conversation_screen.dart';
import 'package:insider/features/threads/view/threads_screen.dart'; // For ThreadsView
import 'package:insider/features/threads/cubit/threads_cubit.dart';
import 'package:insider/features/discovery/view/discovery_screen.dart'; // For DiscoveryScreen
import 'package:insider/features/main/view/tablet_navigation_rail.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/features/chat/view/conversation_history_screen.dart';

class TabletMainScreen extends StatefulWidget {
  const TabletMainScreen({super.key});

  @override
  State<TabletMainScreen> createState() => _TabletMainScreenState();
}

class _TabletMainScreenState extends State<TabletMainScreen> {
  int _selectedIndex = 0;
  String? _activeConversationQuery;
  ChatMode _activeChatMode = ChatMode.simpleQa; // Store the selected mode
  bool _isSidebarExpanded = true; // controls collapsed/expanded state
  bool _showThreadsFullScreen =
      false; // controls full screen threads in portrait
  String? _activeHistoryId;
  String? _activeHistoryTitle;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return BlocProvider(
      create: (context) => Injector.instance<ThreadsCubit>()..getThreads(),
      child: Scaffold(
        backgroundColor:
            isDark ? DesignSystem.backgroundDark : DesignSystem.backgroundLight,
        body: Builder(
          builder: (context) {
            return Row(
              children: [
                // 1. Navigation Rail (Left Sidebar)
                _buildNavigationRail(context, isDark, isPortrait),

                // 2. Threads Sidebar (Middle Column) - only when expanded AND NOT portrait
                if (!isPortrait && _isSidebarExpanded)
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: isDark
                              ? DesignSystem.borderDark
                              : DesignSystem.borderLight,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: ThreadsView(
                      showHeader: false,
                      showFloatingButton: false,
                      onThreadTap: (thread) {
                        setState(() {
                          _activeHistoryId = thread['id'];
                          _activeHistoryTitle = thread['title'];
                          _activeConversationQuery = null;
                        });
                      },
                      onNewChat: () {
                        setState(() {
                          _activeConversationQuery = null;
                          _activeHistoryId = null;
                          _activeChatMode = ChatMode.simpleQa; // Reset mode
                        });
                      },
                    ),
                  ),

                // 3. Main Content Area (Right Column)
                Expanded(
                  child: isPortrait && _showThreadsFullScreen
                      ? ThreadsView(
                          showHeader: false,
                          showFloatingButton: true,
                          onThreadTap: (thread) {
                            setState(() {
                              _showThreadsFullScreen = false;
                              _activeHistoryId = thread['id'];
                              _activeHistoryTitle = thread['title'];
                              _activeConversationQuery = null;
                            });
                          },
                          onNewChat: () {
                            setState(() {
                              _showThreadsFullScreen = false;
                              _activeConversationQuery = null;
                              _activeHistoryId = null;
                              _activeChatMode = ChatMode.simpleQa; // Reset mode
                            });
                          },
                        )
                      : Stack(
                          children: [
                            if (_selectedIndex == 1)
                              const DiscoveryScreen(showBackButton: false)
                            else if (_activeHistoryId != null)
                              ConversationHistoryScreen(
                                key: ValueKey(_activeHistoryId),
                                historyId: _activeHistoryId!,
                                title: _activeHistoryTitle,
                              )
                            else if (_activeConversationQuery != null)
                              ConversationScreen(
                                query: _activeConversationQuery!,
                                chatMode: _activeChatMode, // Pass the mode
                              )
                            else
                              ChatView(
                                onSend: (String message, ChatMode mode) {
                                  FocusScope.of(context)
                                      .unfocus(); // Ensure keyboard is hidden
                                  setState(() {
                                    _activeConversationQuery = message;
                                    _activeHistoryId = null;
                                    _activeChatMode = mode; // Store the mode
                                  });
                                },
                              ),
                          ],
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavigationRail(
      BuildContext context, bool isDark, bool isPortrait) {
    return TabletNavigationRail(
      isDark: isDark,
      isPortrait: isPortrait,
      selectedIndex: _selectedIndex,
      isThreadsActive: isPortrait ? _showThreadsFullScreen : _isSidebarExpanded,
      onLogoTap: () {
        if (isPortrait) {
          setState(() {
            _showThreadsFullScreen = true;
          });
          context.read<ThreadsCubit>().getThreads();
        } else {
          setState(() {
            _isSidebarExpanded = !_isSidebarExpanded;
          });
          if (_isSidebarExpanded) {
            context.read<ThreadsCubit>().getThreads();
          }
        }
      },
      onNewChatTap: () {
        setState(() {
          _selectedIndex = 0; // Switch to Home/Threads tab
          _activeConversationQuery = null; // Reset to new chat
          _activeChatMode = ChatMode.simpleQa; // Reset mode
          if (isPortrait) {
            _showThreadsFullScreen = false; // Hide threads list in portrait
          }
        });
      },
      onHomeTap: () {
        setState(() {
          _selectedIndex = 0;
          if (isPortrait) {
            _showThreadsFullScreen = true;
          } else {
            _isSidebarExpanded = !_isSidebarExpanded;
          }
        });
        if (_selectedIndex == 0) {
          context.read<ThreadsCubit>().getThreads();
        }
      },
      onDiscoverTap: () {
        setState(() {
          _selectedIndex = 1;
          _activeConversationQuery =
              null; // Clear active conversation to show Discovery
          if (isPortrait) {
            _showThreadsFullScreen = false; // Hide threads if in portrait
          }
        });
      },
    );
  }
}
