import 'package:get_it/get_it.dart';
import './local_storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
}