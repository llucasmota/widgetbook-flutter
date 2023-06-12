import 'package:app_widgetbook/utils/color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class Button extends StatelessWidget {
  final double minElevation;
  final double maxElevation;
  final double initialValue;
  final Color fontColor;
  final String platform;
  Color _color = ColorSupport.GREEN_1;

  Button(
      {super.key,
      required this.minElevation,
      required this.maxElevation,
      required this.fontColor,
      required this.initialValue,
      required this.platform})
      : assert(
            (platform.trim().toLowerCase() == 'android' ||
                platform.trim().toLowerCase() == 'ios'),
            'Plataforma deve ser igual a Android ou IOS');

  Button.error(
      {super.key,
      required this.minElevation,
      required this.maxElevation,
      required this.fontColor,
      required this.initialValue,
      required this.platform})
      : assert(
            (platform.trim().toLowerCase() == 'android' ||
                platform.trim().toLowerCase() == 'ios'),
            'Plataforma deve ser igual a Android ou IOS') {
    _color = ColorSupport.ERROR;
  }

  Button.primary(
      {super.key,
      required this.minElevation,
      required this.maxElevation,
      required this.fontColor,
      required this.initialValue,
      required this.platform})
      : assert(
            (platform.trim().toLowerCase() == 'android' ||
                platform.trim().toLowerCase() == 'ios'),
            'Plataforma deve ser igual a Android ou IOS') {
    _color = ColorSupport.GREEN_1;
  }

  Button.alert(
      {super.key,
      required this.minElevation,
      required this.maxElevation,
      required this.fontColor,
      required this.initialValue,
      required this.platform})
      : assert(
            (platform.trim().toLowerCase() == 'android' ||
                platform.trim().toLowerCase() == 'ios'),
            'Plataforma deve ser igual a Android ou IOS') {
    _color = ColorSupport.ALERT;
  }

  Button.success(
      {super.key,
      required this.minElevation,
      required this.maxElevation,
      required this.fontColor,
      required this.initialValue,
      required this.platform})
      : assert(
            (platform.trim().toLowerCase() == 'android' ||
                platform.trim().toLowerCase() == 'ios'),
            'Plataforma deve ser igual a Android ou IOS') {
    _color = ColorSupport.SUCCESS;
  }

  @override
  Widget build(BuildContext context) {
    return platform.trim().toLowerCase() == 'android'
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 60),
                backgroundColor: _color,
                elevation: context.knobs.double.slider(
                    label: 'Slider Elevation',
                    initialValue: initialValue,
                    min: minElevation,
                    max: maxElevation,
                    divisions: 10)),
            onPressed: () {},
            child: Text(
              context.knobs.string(
                label: 'Texto do Botão',
                initialValue: 'Texto do botão',
              ),
              style: TextStyle(color: fontColor),
            ),
          )
        : CupertinoButton(
            disabledColor: Colors.grey,
            pressedOpacity: context.knobs.double.slider(
                label: 'Opacidade',
                initialValue: 0.9,
                min: 0,
                max: 1,
                divisions: 10),
            color: _color,
            child: Text(
                context.knobs.string(
                  label: 'Texto do Botão',
                  initialValue: 'Texto do botão',
                ),
                style: TextStyle(color: fontColor)),
            onPressed: () {},
          );
  }
}
