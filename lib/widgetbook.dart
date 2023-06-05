import 'package:app_widgetbook/main.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const KnobsExample());
}

class KnobsExample extends StatelessWidget {
  const KnobsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devices = [
      Apple.iPhone11,
      Apple.iPhone12,
    ];
    final deviceFrameBuilder = DefaultDeviceFrame(
      setting: DeviceSetting.firstAsSelected(devices: devices),
    );

    final activeFrameBuilder = WidgetbookFrame(
      setting: DeviceSetting.firstAsSelected(devices: devices),
    );

    const code = """
    ## Code blocks
    ```
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

    return Widgetbook.material(
      addons: [
        FrameAddon(
          setting: FrameSetting.firstAsSelected(
            frames: [
              deviceFrameBuilder,
              NoFrame(),
              activeFrameBuilder,
            ],
          ),
        ),
        TextScaleAddon(
          setting: TextScaleSetting.firstAsSelected(
            textScales: [1, 2],
          ),
        ),
        CustomThemeAddon<ThemeData>(
          setting: CustomThemeSetting.firstAsSelected(
            themes: [
              WidgetbookTheme(data: ThemeData.dark(), name: 'dark'),
              WidgetbookTheme(data: ThemeData.light(), name: 'light'),
            ],
          ),
        ),
      ],
      appBuilder: (context, child) {
        final frameBuilder = context.frameBuilder;
        final theme = context.theme<ThemeData>();
        return Theme(
          data: theme!,
          child: frameBuilder!(context, child),
        );
      },
      directories: [
        WidgetbookCategory(
          name: 'Pages',
          children: [
            WidgetbookComponent(
              name: 'On boarding',
              useCases: [
                WidgetbookUseCase(
                  name: 'Home Page',
                  builder: (context) => MyHomePage(
                    title: context.knobs
                        .text(label: 'Title', initialValue: 'Title'),
                    incrementBy: context.knobs
                            .nullableSlider(
                                label: 'Increment By',
                                min: 0,
                                initialValue: 5,
                                max: 10,
                                divisions: 10)
                            ?.toInt() ??
                        0,
                    countLabel: context.knobs.nullableText(
                      label: 'Count Label',
                      initialValue: 'Current Count',
                      description:
                          'This is the text that appears above the current count of increments',
                    ),
                    iconData: context.knobs.options(
                      label: 'Icon',
                      options: [
                        Icons.add,
                        Icons.crop_square_sharp,
                        Icons.circle
                      ],
                    ),
                    showToolTip: context.knobs.boolean(
                      label: 'Show Increment Tool Tip',
                      description:
                          'This is the tooltip that is displayed when hovering over the increment button',
                      initialValue: true,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Button',
                  builder: (context) => Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(200, 60),
                                  backgroundColor: Colors.blueAccent,
                                  elevation: context.knobs.slider(
                                      min: 0,
                                      max: 10,
                                      label: 'Elevação',
                                      initialValue: 0,
                                      description: 'Elevação')),
                              onPressed: () {},
                              child: Text(
                                context.knobs.text(
                                  label: 'Texto do Botão',
                                  initialValue: 'Texto do botão',
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(200, 60),
                                  backgroundColor: Colors.red,
                                  elevation: context.knobs.slider(
                                      min: 0,
                                      max: 10,
                                      label: 'Elevação',
                                      initialValue: 0,
                                      description: 'Elevação')),
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 400,
                                      color: Colors.black26,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Text(code),
                                            ElevatedButton(
                                              child: const Text(
                                                  'Close BottomSheet'),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                context.knobs.text(
                                  label: 'Texto do Botão',
                                  initialValue: 'Texto do botão',
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
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
          ],
        ),
      ],
    );
  }
}
