import 'package:app_widgetbook/widgets/switcher.dart';
import 'package:app_widgetbook/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const KnobsExample());
}

class KnobsExample extends StatelessWidget {
  const KnobsExample({Key? key}) : super(key: key);
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

  Widget showCodeButton(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    final List<DeviceInfo?> devices = [
      Devices.ios.iPhone13,
      Devices.ios.iPhone12ProMax,
      Devices.ios.iPhoneSE,
      Devices.android.samsungGalaxyA50,
      Devices.android.samsungGalaxyS20,
    ];

    return Widgetbook.material(
      addons: [
        DeviceFrameAddon(
          devices: devices,
        ),
        TextScaleAddon(
          scales: [1, 2],
        ),
        MaterialThemeAddon(themes: [
          WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
          WidgetbookTheme(name: 'Light', data: ThemeData.light()),
        ])
      ],
      directories: [
        WidgetbookCategory(
          name: 'Widgets',
          children: [
            WidgetbookComponent(
              name: 'Contained Buttons',
              useCases: [
                WidgetbookUseCase(
                  name: 'Primary Button',
                  builder: (context) => Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        showCodeButton(context),
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
                        showCodeButton(context),
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
                        showCodeButton(context),
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
                        showCodeButton(context),
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
            ),
            WidgetbookComponent(
              name: 'Switcher',
              useCases: [
                WidgetbookUseCase(
                    builder: (context) {
                      return Switcher(
                          demonstrationMode: true,
                          disabledByDefault: context.knobs.boolean(
                              label: 'Switcher desabilitado por padrão'),
                          platform: context.knobs.list(
                              label: 'Tipo de Switch',
                              options: ['ANDROID', 'IOS']));
                    },
                    name: 'Switcher'),
              ],
            )
          ],
        ),
      ],
    );
  }
}
