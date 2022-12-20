import 'package:class_finance_app/src/app_controller.dart';
import 'package:class_finance_app/src/authentication/create_account/create_account_bloc.dart';
import 'package:class_finance_app/src/home/create/create_transaction_cubit.dart';
import 'package:class_finance_app/src/home/create/create_transaction_page.dart';
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
        Bind.factory<CreateTransactionCubit>(
          (i) => CreateTransactionCubit(
            i.get<HomeRepository>(),
            i.get<AppController>().user!.uid,
            i.get<HomeCubit>().userData!,
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const HomePage(),
        ),
        ChildRoute(
          '/create',
          child: (_, args) => CreateTransaction(
            transaction: args.data['transaction'],
            type: args.data['type'],
          ),
        ),
      ];
}
