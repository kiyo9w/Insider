import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:insider/core/bloc_core/ui_status.dart';
import 'package:insider/core/themes/app_themes.dart';
import 'package:insider/features/app/bloc/app_bloc.dart';
import 'package:insider/features/auth/cubit/auth_cubit.dart';
import 'package:insider/generated/l10n.dart';
import 'package:insider/injector/injector.dart';
import 'package:insider/router/app_router.dart';
import 'package:insider/widgets/splash_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppBloc _appBloc;

  @override
  void initState() {
    _appBloc = Injector.instance<AppBloc>()
      ..add(
        const AppEvent.loaded(),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>.value(
      value: _appBloc,
      child: BlocSelector<AppBloc, AppState, UIStatus>(
        bloc: _appBloc,
        selector: (state) => state.status,
        builder: (context, appStatus) {
          return appStatus.when(
            initial: () => const SplashPage(),
            loading: () => const SplashPage(),
            loadFailed: (_) => const SizedBox(),
            loadSuccess: (_) => const _App(),
          );
        },
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    final String locale = context.select(
      (AppBloc value) => value.state.locale,
    );

    final bool isDarkMode = context.select(
      (AppBloc value) => value.state.isDarkMode,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => Injector.instance<AuthCubit>()..checkAuthStatus(),
          lazy: false,
        ),
        BlocProvider<AppBloc>.value(
          value: context.read<AppBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: const AppLocalizationDelegate().supportedLocales,
        locale: Locale(locale),
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        routerConfig: AppRouter.router,
        title: 'BoilerPlate',
      ),
    );
  }
}
