import 'package:app_widgetbook/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class PrimaryButtonWBCase extends WidgetbookUseCase {
  const PrimaryButtonWBCase({required super.name, required super.builder});

  WidgetbookUseCase build(BuildContext context) {
    return WidgetbookUseCase(
      name: 'Primary Button',
      builder: (context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button.primary(
                    minElevation: 0,
                    maxElevation: 10,
                    fontColor: Colors.white,
                    initialValue: 0)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
