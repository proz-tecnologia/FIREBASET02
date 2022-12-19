import 'package:class_finance_app/src/home/create/create_transaction_cubit.dart';
import 'package:class_finance_app/src/home/create/create_transaction_state.dart';
import 'package:class_finance_app/src/shared/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateTransaction extends StatefulWidget {
  final FinancialTransaction? transaction;
  final TransactionType type;

  const CreateTransaction({
    super.key,
    this.transaction,
    required this.type,
  });

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  late final TextEditingController nameController;
  late final MoneyMaskedTextController valueController;
  late final TextEditingController categoryController;

  final cubit = Modular.get<CreateTransactionCubit>();

  String get type =>
      (widget.transaction?.type ?? widget.type) == TransactionType.received
          ? 'receita'
          : 'despesa';
  String get buttonTitle =>
      (widget.transaction != null) ? 'Salvar edição' : 'Criar';

  Color get colorByType =>
      (widget.transaction?.type ?? widget.type) == TransactionType.received
          ? Colors.green
          : Colors.red;

  @override
  void initState() {
    nameController = TextEditingController(
      text: fillValue(
        widget.transaction?.name,
      ),
    );
    valueController = MoneyMaskedTextController(
      precision: 2,
      leftSymbol: 'R\$ ',
      initialValue: widget.transaction?.value ?? 0,
    );
    categoryController = TextEditingController(
      text: fillValue(
        widget.transaction?.category,
      ),
    );

    super.initState();
  }

  String? fillValue(String? value) {
    if (value != null && value.isNotEmpty) {
      return value;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTransactionCubit>(
      create: (context) => cubit,
      child: BlocListener<CreateTransactionCubit, CreateTransactionState>(
        listener: (context, state) {
          if (state is CreateTransactionStateLoading) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is CreateTransactionStateSuccess) {
            Modular.to.popUntil(ModalRoute.withName('/home/'));
          } else if (state is CreateTransactionStateError) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: colorByType,
            leading: BackButton(
              onPressed: () {
                Modular.to.pop();
              },
            ),
            title: Text('Crie sua $type'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: valueController,
                decoration: InputDecoration(
                  hintText: 'Valor',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                inputFormatters: [
                  MaskTextInputFormatter(
                      mask: 'R\$ 000,00', filter: {"0": RegExp(r'[0-9]')})
                ],
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(
                  hintText: 'Categoria',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                cubit.createTransaction(
                  transaction: FinancialTransaction(
                    type: widget.type,
                    value: valueController.numberValue,
                    name: nameController.text,
                    category: categoryController.text,
                    id: widget.transaction?.id,
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(buttonTitle),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
