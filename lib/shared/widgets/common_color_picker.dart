import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:gastu_card/core/utils/extensions/double_ext.dart';

import '../../app/styles/dimension.dart';

class CommonColorPicker extends StatefulWidget {

  final String? helperText;
  final Color value;
  final void Function(String) onColorChanged;

  const CommonColorPicker({
    super.key,
    required this.value,
    this.helperText,
    required this.onColorChanged,
  });

  @override
  State<StatefulWidget> createState() => _CommonColorPickerState();
}

class _CommonColorPickerState extends State<CommonColorPicker> {

  final List<Color> _predefinedColors = [
    Colors.red,
    Colors.green.shade900,
    Colors.orange.shade900,
    Colors.purple.shade900,
    Colors.teal.shade400,
    Colors.blueGrey.shade800,
  ];

  Color _selectedColor = Colors.blue;
  bool _isCustomColor = false;

  @override
  void initState() {
    setState(() {
      _selectedColor = widget.value;
    });
    super.initState();
  }

  void _showColorWheelPicker() async {
    final Color picked = await showColorPickerDialog(
      context,
      _selectedColor,
      title: const Text('Pick Any Color'),
      pickersEnabled: const {
        ColorPickerType.both: false,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.customSecondary: false,
        ColorPickerType.wheel: true,
      },
      enableShadesSelection: true,
      width: 40,
      height: 40,
      borderRadius: 46,
      elevation: 0,
      borderColor: Colors.black38,
      hasBorder: true,
      wheelHasBorder: true,
    );
    setState(() {
      _isCustomColor = true;
      _selectedColor = picked;
    });
    widget.onColorChanged.call(picked.hexAlpha);
  }


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
            Dimension.spacingMedium.height(),
            Wrap(
              spacing: 8,
              children: [
                ..._predefinedColors.map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _isCustomColor = false;
                        _selectedColor = color;
                      });
                      widget.onColorChanged.call(_selectedColor.hexAlpha);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:Colors.black
                            ),
                          ),
                        ),
                        if (_selectedColor == color && !_isCustomColor) Icon(Icons.check_rounded, color: Colors.white)
                      ],
                    ),
                  );
                }),

                // 🔘 "Any Color" option
                GestureDetector(
                  onTap: _showColorWheelPicker,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const SweepGradient(
                            colors: [
                              Colors.red,
                              Colors.orange,
                              Colors.yellow,
                              Colors.green,
                              Colors.cyan,
                              Colors.blue,
                              Colors.purple,
                              Colors.red,
                            ],
                          ),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        )
                      ),
                      if (_isCustomColor) Icon(Icons.check_rounded, color: Colors.white)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

