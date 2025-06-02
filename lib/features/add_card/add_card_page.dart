import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gastu_card/core/utils/extensions/context_ext.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';
import 'package:gastu_card/core/utils/extensions/int_ext.dart';
import 'package:gastu_card/core/utils/extensions/num_ext.dart';
import 'package:gastu_card/core/utils/extensions/string_ext.dart';
import 'package:go_router/go_router.dart';

import '../../app/styles/dimension.dart';
import '../../shared/constants/enums/credit_card_network_enum.dart';
import '../../shared/widgets/common_color_picker.dart';
import '../../shared/widgets/common_dropdown.dart';
import '../../shared/widgets/common_elevated_button.dart';
import '../../shared/widgets/common_scaffold.dart';
import '../../shared/widgets/common_text_field.dart';
import 'bloc/add_card_bloc.dart';

class AddCardPageWrapper extends StatelessWidget {
  const AddCardPageWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddCardBloc(),
      child: AddCardPage(),
    );
  }
}

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});
  @override
  State<StatefulWidget> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {

  final _bankNameController = TextEditingController();
  final _creditLimitController = TextEditingController();
  final _statementDateController = TextEditingController();
  final _paymentDueDateController = TextEditingController();
  CreditCardNetworkEnum _cardType = CreditCardNetworkEnum.visa;
  DateTime? _statementDate;
  DateTime? _paymentDueDate;
  Color _color = Colors.red;

  final _dateToday = DateTime.now();

  bool get _isCompleted {
    return _bankNameController.text.trim().isNotEmpty &&
    _creditLimitController.text.trim().isNotEmpty && 
    _statementDateController.text.trim().isNotEmpty && 
    _paymentDueDateController.text.trim().isNotEmpty &&
    _statementDate != null &&
    _paymentDueDate != null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCardBloc, AddCardState>(
      listener: (context, state) {
        if (state is SuccessState) {
          context.showAnimatedSuccessDialog(
            title: "You've successfully added new card",
            onButtonPressed: () {
              while (context.canPop()) {
                context.pop();
              } 
            },
          );
        } else if (state is ErrorState) {
          context.showAnimatedErrorDialog(title: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CommonScaffold(
          appBar: AppBar(
            title: Text("Add Card"),
            surfaceTintColor: Colors.transparent,
            centerTitle: false,
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimension.paddingMedium
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Dimension.spacingLarge.height(),
                          CommonTextField(
                            controller: _bankNameController,
                            helperText: "Card Name",
                            hintText: "e.g., BDO, BPI, RCBC, UNION BANK",
                            border: OutlineInputBorder(),
                            fillColor: Colors.transparent,
                            filled: true,
                            textInputAction: TextInputAction.next,
                            onChanged: (p0) {
                              setState(() { });
                            },
                          ),
                          Dimension.spacingLarge.height(),
                          CommonDropDown(
                            helperText: "Card Type",
                            value: _cardType.label,
                            items: CreditCardNetworkEnum.values.map((e) => e.label).toList(),
                            border: OutlineInputBorder(),
                            onChanged: (value) {
                              _cardType = value?.toCreditCardNetwork ?? CreditCardNetworkEnum.visa;
                              setState(() { });
                            },
                          ),
                          Dimension.spacingLarge.height(),
                          CommonColorPicker(
                            value: _color,
                            helperText: "Card Theme",
                            onColorChanged: (selectedColor) {
                              _color = selectedColor.toColor;
                              setState(() { });
                            },
                          ),
                          Dimension.spacingLarge.height(),
                          CommonTextField(
                            controller: _creditLimitController,
                            helperText: "Credit Limit",
                            hintText: "e.g., ${5000.toCurrency()}",
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Dimension.spacingSmall,
                                horizontal: Dimension.paddingMedium
                              ),
                              child: Text("₱", style: TextStyle(fontSize: 24.0)),
                            ),
                            border: OutlineInputBorder(),
                            fillColor: Colors.transparent,
                            filled: true,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            onChanged: (p0) {
                              setState(() { });
                            },
                          ),
                          Dimension.spacingLarge.height(),
                          CommonTextField(
                            controller: _statementDateController,
                            readOnly: true,
                            helperText: "Statement Date",
                            onTap: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: _dateToday,
                                firstDate: DateTime(_dateToday.year - 2),
                                lastDate: DateTime(9999),
                              );
                              if (selectedDate != null) {
                                _statementDate = selectedDate;
                                _statementDateController.text = "${_statementDate?.day.formatDaySuffix} of the month";
                                setState(() { });
                              }
                            },
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                            hintText: "Select date",
                          ),
                          Dimension.spacingLarge.height(),
                          CommonTextField(
                            controller: _paymentDueDateController,
                            readOnly: true,
                            helperText: "Payment Due Date",
                            onTap: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: _dateToday,
                                firstDate: DateTime(_dateToday.year - 2),
                                lastDate: DateTime(9999),
                              );
                              if (selectedDate != null) {
                                _paymentDueDate = selectedDate;
                                _paymentDueDateController.text = "${_paymentDueDate?.day.formatDaySuffix} of the month";
                                setState(() { });
                              }
                            },
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                            hintText: "Select date",
                          ),
                          Dimension.spacingLarge.height(),
                          Spacer(),
                          Dimension.spacingLarge.height(),
                          CommonElevatedButton(
                            backgroundColor: Colors.teal.shade900,
                            onButtonPressed: _isCompleted ? () {
                              context.read<AddCardBloc>().add(
                                DoAddCardEvent(
                                  bankName: _bankNameController.text.trim(), 
                                  creditLimit: double.parse(_creditLimitController.text), 
                                  cardType: _cardType, 
                                  paymentDueDate: _paymentDueDate ?? DateTime.now(), 
                                  statementDate: _statementDate ?? DateTime.now(),
                                  hexColor: _color.hexAlpha
                                )
                              );
                            } : null,
                            borderRadius: BorderRadius.circular(100.0),
                            padding: EdgeInsets.all(Dimension.paddingMedium),
                            custom: Center(
                              child: Text(
                                "Add New Card",
                                style: TextStyle(
                                  fontSize: Dimension.fontMedium,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                                ),
                              ),
                            )
                          ),
                          Dimension.spacingMedium.height()
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          )
        );
      }
    );
  }
}