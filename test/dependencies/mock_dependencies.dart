import 'package:insider/data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import 'package:insider/data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import 'package:insider/services/app_service/app_service.dart';
import 'package:insider/services/local_storage_service/local_storage_service.dart';
import 'package:insider/services/log_service/log_service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DogImageRandomRepository,
  DogImageLocalRepository,
  LogService,
  AppService,
  LocalStorageService,

  // TODO(boilerplate): add more dependencies
])
void main() {}
