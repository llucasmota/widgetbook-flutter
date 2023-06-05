import 'package:app_widgetbook/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class Button extends StatelessWidget {
  final double minElevation;
  final double maxElevation;
  final double initialValue;
  final Color fontColor;
  Color _color = ColorSupport.GREEN_1;

  Button(
      {super.key,
      required this.minElevation,
      required this.maxElevation,
      required this.fontColor,
      required this.initialValue});

  Button.error(
      {Key? key,
      required this.minElevation,
      required this.maxElevation,
      required this.fontColor,
      required this.initialValue})
      : super(key: key) {
    _color = ColorSupport.ERROR;
  }

  Button.primary(
      {Key? key,
      required this.minElevation,
      required this.maxElevation,
      required this.fontColor,
      required this.initialValue})
      : super(key: key) {
    _color = ColorSupport.GREEN_1;
  }

  Button.alert(
      {Key? key,
      required this.minElevation,
      required this.maxElevation,
      required this.fontColor,
      required this.initialValue})
      : super(key: key) {
    _color = ColorSupport.ALERT;
  }

  Button.success(
      {Key? key,
      required this.minElevation,
      required this.maxElevation,
      required this.fontColor,
      required this.initialValue})
      : super(key: key) {
    _color = ColorSupport.SUCCESS;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 60),
          backgroundColor: _color,
          elevation: context.knobs.slider(
              min: minElevation,
              max: maxElevation,
              label: 'Elevação',
              initialValue: initialValue,
              description: 'Elevação')),
      onPressed: () {},
      child: Text(
        context.knobs.text(
          label: 'Texto do Botão',
          initialValue: 'Texto do botão',
        ),
        style: TextStyle(color: fontColor),
      ),
    );
  }
}
