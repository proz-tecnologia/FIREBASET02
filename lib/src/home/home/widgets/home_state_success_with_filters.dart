import 'package:flutter/material.dart';

import '../home_state.dart';
import 'finance_widget.dart';

class HomeStateSucessWithFiltersWidget extends StatelessWidget {
  const HomeStateSucessWithFiltersWidget({
    Key? key,
    required this.state,
    required this.selectedCategories,
    required this.onSelectItem,
  }) : super(key: key);

  final HomeStateSuccess state;

  final List<String> selectedCategories;
  final Function(String value) onSelectItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.transactions.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                children: state.user.categories.map((String e) {
                  return SizedBox(
                    height: 36.0,
                    width: 120.0,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        4.0,
                      ),
                      child: InkWell(
                        onTap: () => onSelectItem(e),
                        child: Chip(
                          label: Text(e),
                          backgroundColor: selectedCategories.contains(e)
                              ? Colors.blue
                              : null,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              FinanceOperationWidget(
                transaction: state.transactions[index],
              ),
            ],
          );
        }
        return FinanceOperationWidget(
          transaction: state.transactions[index],
        );
      },
    );
  }
}
