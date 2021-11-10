import 'package:get_it/get_it.dart';
import 'package:todolist/viewModels/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  
  // VIEW MODELS

  locator.registerFactory(() => HomeModel());

  // SERVICES

  
}