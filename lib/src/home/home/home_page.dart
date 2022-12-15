import 'package:class_finance_app/src/home/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/utils/formatter.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => Modular.get<HomeCubit>()..getUserData(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeStateSuccess) {
                return Flex(
                  direction: Axis.vertical,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(16.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá, seja bem vindo ${state.user.userName}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              '    Seu saldo é',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                Formatters.formatToReal(state.user.balance),
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        color: Colors.white,
                      ),
                    )
                  ],
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}