import 'package:insider/injector/injector.dart';
import 'package:insider/injector/modules/dio_module.dart';
import 'package:rest_client/rest_client.dart';

class RestClientModule {
  RestClientModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<DogApiClient>(
      () => DogApiClient(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );
    injector.registerFactory<AuthClient>(
      () => AuthClient(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );
    injector.registerFactory<NewsClient>(
      () => NewsClient(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );
    injector.registerFactory<WorkflowClient>(
      () => WorkflowClient(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );
    injector.registerFactory<ProfileClient>(
      () => ProfileClient(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );
  }
}
