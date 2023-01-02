import 'package:flutter/material.dart';

import '../home_state.dart';
import 'home_header.dart';
import 'home_state_empty_widget.dart';
import 'home_state_success_with_filters.dart';

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
        HomeHeader(widget: widget),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            color: Colors.grey.shade200,
            child: widget.state.transactions.isEmpty
                ? const HomeEmptyStateWidget()
                : HomeStateSucessWithFiltersWidget(
                    onSelectItem: widget.onSelectItem,
                    selectedCategories: widget.selectedCategories,
                    state: widget.state,
                  ),
          ),
        )
      ],
    );
  }
}
