import 'package:class_finance_app/src/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'authentication/authentication_module.dart';
import 'home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<AppController>(
          (i) => AppController(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: AuthenticationModule(),
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
      ];
}
