import 'package:get_it/get_it.dart';
import 'package:wisata_surabaya/src/services/base_api.dart';
import 'package:wisata_surabaya/src/services/navigation_service.dart';
import 'package:wisata_surabaya/src/services/service.dart';
import 'package:wisata_surabaya/src/repository/wisata_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BaseApi());
  locator.registerLazySingleton(() => Service());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => WisataRepository());
}