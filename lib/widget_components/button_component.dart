import 'package:app_widgetbook/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class ButtonComponent extends WidgetbookComponent {
  const ButtonComponent({required super.name, required super.useCases});

  static const code = """
    ## Code blocks
    ```dart
      Button.primary(
      platform: context.knobs.list(
          label: 'Tipo de Switch',
          options: ['ANDROID', 'IOS']),
          minElevation: 0,
          maxElevation: 10,
          fontColor: Colors.white,
          initialValue: 0)
    ```
""";

  Widget _showCodeButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _showCode(context),
      icon: const Icon(Icons.code),
      label: const Text('Visualizar código'),
    );
  }

  void _showCode(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          width: double.infinity,
          color: Colors.black26,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(code),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  WidgetbookComponent build(BuildContext context) {
    return WidgetbookComponent(
      name: 'Contained Buttons',
      useCases: [
        WidgetbookUseCase(
          name: 'Primary Button',
          builder: (context) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _showCodeButton(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button.primary(
                        platform: context.knobs.list(
                            label: 'Tipo de Switch',
                            options: ['ANDROID', 'IOS']),
                        minElevation: 0,
                        maxElevation: 10,
                        fontColor: Colors.white,
                        initialValue: 0)
                  ],
                ),
              ],
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'Button Error',
          builder: (context) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _showCodeButton(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button.error(
                        platform: context.knobs.list(
                            label: 'Tipo de Switch',
                            options: ['ANDROID', 'IOS']),
                        minElevation: 0,
                        maxElevation: 10,
                        fontColor: Colors.white,
                        initialValue: 0)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'Button Alert',
          builder: (context) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _showCodeButton(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button.alert(
                        platform: context.knobs.list(
                            label: 'Tipo de Switch',
                            options: ['ANDROID', 'IOS']),
                        minElevation: 0,
                        maxElevation: 10,
                        fontColor: Colors.white,
                        initialValue: 0)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'Button Success',
          builder: (context) => Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _showCodeButton(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button.success(
                        platform: context.knobs.list(
                            label: 'Tipo de Switch',
                            options: ['ANDROID', 'IOS']),
                        minElevation: 0,
                        maxElevation: 10,
                        fontColor: Colors.white,
                        initialValue: 0)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
