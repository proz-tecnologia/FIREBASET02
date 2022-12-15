import 'package:class_finance_app/src/authentication/create_account/create_account_bloc.dart';
import 'package:class_finance_app/src/authentication/login/login_bloc.dart';
import 'package:class_finance_app/src/authentication/login/login_page.dart';
import 'package:class_finance_app/src/authentication/recovery_password/recovery_password_cubit.dart';
import 'package:class_finance_app/src/authentication/recovery_password/recovery_password_page.dart';
import 'package:class_finance_app/src/authentication/repository/repository.dart';
import 'package:class_finance_app/src/authentication/repository/repository_impl.dart';
import 'package:class_finance_app/src/authentication/splash/splash_controller.dart';
import 'package:class_finance_app/src/authentication/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'create_account/create_account_page.dart';

class AuthenticationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<AuthRepository>(
          (i) => AuthRepositoryImpl(),
        ),
        Bind.lazySingleton<SplashBloc>(
          (i) => SplashBloc(
            repository: i.get<AuthRepository>(),
          ),
        ),
        Bind.lazySingleton<LoginCubit>(
          (i) => LoginCubit(
            repository: i.get<AuthRepository>(),
          ),
        ),
        Bind.lazySingleton<RecoveryPasswordCubit>(
          (i) => RecoveryPasswordCubit(
            repository: i.get<AuthRepository>(),
          ),
        ),
        Bind.lazySingleton<CreateAccountCubit>(
          (i) => CreateAccountCubit(
            repository: i.get<AuthRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const SplashPage(),
        ),
        ChildRoute(
          '/login',
          child: (_, args) => const LoginPage(),
        ),
        ChildRoute(
          '/recoveryPassword',
          child: (_, args) => const RecoveryPasswordPage(),
        ),
        ChildRoute(
          '/createAccount',
          child: (_, args) => const CreateAccountPage(),
        )
      ];
}
