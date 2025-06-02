
import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/int_ext.dart';

import '../../app/styles/dimension.dart';

class CommonDropDown extends StatefulWidget {

  final String? helperText;
  final String? value;
  final List<String>? items;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final void Function(String?)? onChanged;

  const CommonDropDown({
    super.key, 
    this.value,
    this.items,
    this.helperText,
    this.enabledBorder,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    required this.onChanged
  });
  
  @override
  State<StatefulWidget> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        if (widget.helperText != null) Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.helperText ?? "",
              style: TextStyle(
                fontSize: Dimension.fontMedium, 
                fontWeight: FontWeight.w500,
                color: Colors.teal.shade900
              ),
            ),
            8.height(),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                enabledBorder: widget.enabledBorder ?? widget.border ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color:Color(0xFFE8E8E8),
                  width: 0.5
                ),
              ),
              border: widget.border ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: Color(0xFFE8E8E8),
                  width: 0.5
                ),
              ),
              focusedBorder: widget.focusedBorder ?? widget.border ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: Color(0xFFE8E8E8),
                  width: 0.5
                ),
              ),
              errorBorder: widget.errorBorder ?? widget.border ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                  width: 2.0
                ),
              ),
              focusedErrorBorder: widget.focusedErrorBorder ?? widget.border ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                  width: 2.0
                ),
              ),
              ),
              borderRadius: BorderRadius.circular(3),
              value: widget.value,
              items: (widget.items ?? []).map((card) {
                return DropdownMenuItem(value: card, child: Text(card));
              }).toList(),
              onChanged: (value) {
                widget.onChanged?.call(value);
              },
            ),
          ],
        ),
      ],
    );
  }
}