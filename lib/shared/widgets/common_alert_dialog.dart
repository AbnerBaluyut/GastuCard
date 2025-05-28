import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/context_ext.dart';

import 'common_elevated_button.dart';

class CommonAlertDialog extends StatelessWidget {

  const CommonAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  final Widget title;
  final Widget content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
  
    return AlertDialog(
      title: title,
      content: content,
      backgroundColor: Colors.white,
      actions: actions ?? [
        CommonElevatedButton(
          text: "OK",
          fontWeight: FontWeight.w500,
          onButtonPressed: () {
            context.popSafely();
          },
        ),
      ],
    );
  }  
}