import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

Future<void> configureDependencies() async => getIt.init();
