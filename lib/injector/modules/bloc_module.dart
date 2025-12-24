import 'package:flutter/foundation.dart';
import 'package:insider/features/app/bloc/app_bloc.dart';
import 'package:insider/features/auth/cubit/auth_cubit.dart';
import 'package:insider/features/demo/bloc/demo_bloc.dart';
import 'package:insider/features/dog_image_random/bloc/dog_image_random_bloc.dart';
import 'package:insider/features/threads/cubit/threads_cubit.dart';
import 'package:insider/injector/injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector
      ..registerLazySingleton<AppBloc>(
        () => AppBloc(
          appService: injector(),
          logService: injector(),
        ),
      )
      ..registerLazySingleton<AuthCubit>(
        () => AuthCubit(
          authRepository: injector(),
          localStorageService: injector(),
          notificationService: injector(),
        ),
      )
      ..registerFactory<DogImageRandomBloc>(
        () => DogImageRandomBloc(
          dogImageRandomRepository: injector(),
          dogImageLocalRepository: kIsWeb ? null : injector(),
          logService: injector(),
        ),
      )
      ..registerFactory<DemoBloc>(
        () => DemoBloc(
          dogImageRandomRepository: injector(),
          logService: injector(),
        ),
      )
      ..registerFactory<ThreadsCubit>(
        () => ThreadsCubit(injector()),
      );
  }
}
