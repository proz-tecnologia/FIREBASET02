import 'package:class_finance_app/src/home/home/home_cubit.dart';
import 'package:class_finance_app/src/home/home/widgets/home_fab.dart';
import 'package:class_finance_app/src/home/home/widgets/home_state_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> selectedCategories = [];

  void addCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }

    Modular.get<HomeCubit>().getUserData(selectedCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => Modular.get<HomeCubit>()..getUserData(),
          child: RefreshIndicator(
            onRefresh: () => Modular.get<HomeCubit>().getUserData(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeStateLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeStateSuccess) {
                  return HomeStateSuccessWidget(
                    state: state,
                    selectedCategories: selectedCategories,
                    onSelectItem: (value) => addCategory(value),
                  );
                }

                return Container();
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: const HomeFab(),
    );
  }
}
