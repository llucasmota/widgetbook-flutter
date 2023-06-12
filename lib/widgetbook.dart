import 'package:app_widgetbook/widget_cases/switcher.dart';
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
    style: ElevatedButton.styleFrom(
    fixedSize: const Size(200, 60),
    backgroundColor: Colors.red,
    elevation: context.knobs.slider(
        min: 0,
        max: 10,
        label: 'Elevação',
        initialValue: 0,
        description: 'Elevação')),
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
                  name: 'Button Switcher',
                  builder: (context) => Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        showCodeButton(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Switch.adaptive(
                              value: true,
                              onChanged: (value) {
                                print(value);
                              },
                            )
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
