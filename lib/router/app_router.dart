import 'package:insider/features/app/view/app_director.dart';
import 'package:insider/features/demo/view/assets_page.dart';
import 'package:insider/features/demo/view/images_from_db_page.dart';
import 'package:insider/features/dog_image_random/view/dog_image_random_page.dart';
import 'package:insider/features/discovery/view/discovery_screen.dart';
import 'package:insider/features/home/home_page.dart';
import 'package:insider/features/main/view/main_shell.dart';
import 'package:insider/features/setting/setting_page.dart';
import 'package:insider/features/setting/account_screen.dart';
import 'package:insider/features/setting/language_screen.dart';
import 'package:insider/features/setting/theme_screen.dart';
import 'package:insider/features/threads/view/threads_screen.dart';
import 'package:insider/generated/l10n.dart';
import 'package:insider/widgets/error_page.dart';
import 'package:insider/features/chat/view/conversation_history_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:insider/features/threads/cubit/threads_cubit.dart';
import 'package:insider/injector/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insider/features/discovery/view/news_detail_screen.dart';
import 'package:rest_client/rest_client.dart';

class AppRouter {
  AppRouter._();

  static const String appDirector = 'appDirector';
  static const String appDirectorPath = '/';

  static const String homeNamed = 'home';
  static const String homePath = '/';

  static const String settingNamed = 'setting';
  static const String settingPath = '/setting';

  static const String assetsNamed = 'assets';
  static const String assetsPath = '/assets';

  static const String dogImageRandomNamed = 'dogImageRandom';
  static const String dogImageRandomPath = '/dogImageRandom';

  static const String imagesFromDbNamed = 'imagesFromDb';
  static const String imagesFromDbPath = '/imagesFromDb';

  static const String accountNamed = 'account';
  static const String accountPath = '/account';

  static const String threadsNamed = 'threads';
  static const String threadsPath = '/main/threads';

  static const String discoveryNamed = 'discovery';
  static const String discoveryPath = '/main/discovery';

  static const String themeNamed = 'theme';
  static const String themePath = '/theme';

  static const String languageNamed = 'language';
  static const String languagePath = '/language';

  static const String conversationNamed = 'conversation';
  static const String conversationPath = '/main/conversation/:id';

  static String conversationRoute(String id) => '/main/conversation/$id';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: appDirector,
        path: appDirectorPath,
        builder: (context, state) {
          return const AppDirector();
        },
      ),
      GoRoute(
        name: homeNamed,
        path: homePath,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: settingNamed,
        path: settingPath,
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        name: accountNamed,
        path: accountPath,
        builder: (context, state) => const AccountScreen(),
      ),
      GoRoute(
        name: themeNamed,
        path: themePath,
        builder: (context, state) => const ThemeScreen(),
      ),
      GoRoute(
        name: languageNamed,
        path: languagePath,
        builder: (context, state) => const LanguageScreen(),
      ),
      GoRoute(
        name: assetsNamed,
        path: assetsPath,
        builder: (context, state) => const AssetsPage(),
      ),
      GoRoute(
        name: dogImageRandomNamed,
        path: dogImageRandomPath,
        builder: (context, state) => const DogImageRandomPage(),
      ),
      GoRoute(
        name: imagesFromDbNamed,
        path: imagesFromDbPath,
        builder: (context, state) {
          if (!kIsWeb) {
            return const ImagesFromDbPage();
          }

          return ErrorPage(
            content: S.current.didnt_supported,
          );
        },
      ),
      GoRoute(
        name: threadsNamed,
        path: threadsPath,
        builder: (context, state) => MainShell(
          child: BlocProvider(
            create: (context) => Injector.instance<ThreadsCubit>(),
            child: const ThreadsScreen(),
          ),
        ),
      ),
      GoRoute(
        name: discoveryNamed,
        path: discoveryPath,
        builder: (context, state) => const MainShell(
          child: DiscoveryScreen(),
        ),
      ),
      GoRoute(
        name: conversationNamed,
        path: conversationPath,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          final extras = state.extra as Map<String, dynamic>?;
          final title = extras?['title'] as String?;

          if (id == null) {
            return MainShell(
              child: ErrorPage(content: 'Conversation ID is missing'),
            );
          }

          return MainShell(
            child: ConversationHistoryScreen(
              historyId: id,
              title: title,
            ),
          );
        },
      ),
      GoRoute(
        path: '/news/detail',
        builder: (context, state) {
          final article = state.extra as ArticleListItem?;
          if (article == null) {
            return ErrorPage(content: 'Article not found');
          }
          return NewsDetailScreen(newsId: article.id, article: article);
        },
      ),
    ],
  );
}
