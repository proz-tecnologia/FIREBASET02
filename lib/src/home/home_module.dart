import 'package:class_finance_app/src/app_controller.dart';
import 'package:class_finance_app/src/home/home/home_cubit.dart';
import 'package:class_finance_app/src/home/home/home_page.dart';
import 'package:class_finance_app/src/home/repository/home_repository.dart';
import 'package:class_finance_app/src/home/repository/home_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<HomeRepository>(
          (i) => HomeRepositoryImpl(),
        ),
        Bind.singleton<HomeCubit>(
          (i) => HomeCubit(
            repository: i.get<HomeRepository>(),
            id: i.get<AppController>().user!.uid,
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const HomePage(),
        )
      ];
}