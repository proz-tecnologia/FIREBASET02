import 'package:flutter_modular/flutter_modular.dart';

import 'authentication/authentication_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: AuthenticationModule(),
        ),
      ];
}
