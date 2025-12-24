import 'package:insider/data/repositories/auth/auth_repository.dart';
import 'package:insider/data/repositories/auth/auth_repository_impl.dart';
import 'package:insider/data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import 'package:insider/data/repositories/dog_image_random/remote/dog_image_random_repository_impl.dart';
import 'package:insider/data/repositories/news/news_repository.dart';
import 'package:insider/data/repositories/news/news_repository_impl.dart';
import 'package:insider/data/repositories/chat/chat_repository.dart';
import 'package:insider/data/repositories/chat/chat_repository_impl.dart';
import 'package:insider/data/repositories/profile/profile_repository.dart';
import 'package:insider/data/repositories/profile/profile_repository_impl.dart';
import 'package:insider/injector/injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<DogImageRandomRepository>(
      () => DogImageRandomRepositoryImpl(
        dogApiClient: injector(),
      ),
    );
    injector.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        authClient: injector(),
      ),
    );
    injector.registerFactory<NewsRepository>(
      () => NewsRepositoryImpl(
        newsClient: injector(),
      ),
    );
    injector.registerFactory<ChatRepository>(
      () => ChatRepositoryImpl(
        workflowClient: injector(),
      ),
    );
    injector.registerFactory<ProfileRepository>(
      () => ProfileRepositoryImpl(
        profileClient: injector(),
      ),
    );
  }
}
