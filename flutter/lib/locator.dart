import 'package:forget_password/core/services/api_service.dart';
import 'package:forget_password/core/states/request_state.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setupLocator(){
  locator.registerLazySingleton(() => RequestState());
  locator.registerLazySingleton(() => ApiService());
}