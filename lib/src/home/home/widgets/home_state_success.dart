import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/utils/formatter.dart';
import '../home_cubit.dart';
import '../home_state.dart';
import 'finance_widget.dart';

class HomeStateSuccessWidget extends StatefulWidget {
  final HomeStateSuccess state;
  final List<String> selectedCategories;
  final Function(String value) onSelectItem;
  const HomeStateSuccessWidget({
    super.key,
    required this.state,
    required this.selectedCategories,
    required this.onSelectItem,
  });

  @override
  State<HomeStateSuccessWidget> createState() => _HomeStateSuccessWidgetState();
}

class _HomeStateSuccessWidgetState extends State<HomeStateSuccessWidget> {
  @override
  Widget build(BuildContext context) {
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
                  'Olá, seja bem vindo ${widget.state.user.userName}',
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
                    Formatters.formatToReal(widget.state.user.balance),
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
            color: Colors.grey.shade200,
            child: widget.state.transactions.isEmpty
                ? const Center(
                    child: Text('Voce ainda não tem transaç˜oes'),
                  )
                : ListView.builder(
                    itemCount: widget.state.transactions.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Wrap(
                              children:
                                  widget.state.user.categories.map((String e) {
                                return SizedBox(
                                  height: 36.0,
                                  width: 120.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      4.0,
                                    ),
                                    child: InkWell(
                                      onTap: () => widget.onSelectItem(e),
                                      child: Chip(
                                        label: Text(e),
                                        backgroundColor: widget
                                                .selectedCategories
                                                .contains(e)
                                            ? Colors.blue
                                            : null,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            FinanceOperationWidget(
                              transaction: widget.state.transactions[index],
                            ),
                          ],
                        );
                      }
                      return FinanceOperationWidget(
                        transaction: widget.state.transactions[index],
                      );
                    },
                  ),
          ),
        )
      ],
    );
    ;
  }
}
