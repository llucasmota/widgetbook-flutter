import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [platform] IOS | Android

class Switcher extends StatefulWidget {
  final String platform;
  final bool disabledByDefault;
  final Function? callOnChange;
  final bool demonstrationMode;
  Switcher({
    super.key,
    required this.platform,
    this.callOnChange,
    required this.disabledByDefault,
    required this.demonstrationMode,
  }) : assert(
            (platform.trim().toLowerCase() == 'android' ||
                platform.trim().toLowerCase() == 'ios'),
            'Plataforma deve ser igual a Android ou IOS');

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  late bool _enable;

  @override
  void initState() {
    // TODO: implement initState
    _enable = false;
    super.initState();
  }

  static const String code = """
    ## Code blocks
    Switcher(
      demonstrationMode: true,
      disabledByDefault: context.knobs.boolean(
      label: 'Switcher desabilitado por padrão'),
      platform: platform)); // IOS or Android
 
""";

  void _toggleSwitcher() {
    setState(() {
      _enable = !_enable;
    });
    if (widget.callOnChange != null) {
      widget.callOnChange!();
    }
  }

  Widget showCodeButton(BuildContext context, Widget child) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        child,
        ElevatedButton.icon(
          onPressed: () => _showCode(context),
          icon: const Icon(Icons.code),
          label: const Text('Visualizar código'),
        ),
      ],
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
    if (widget.platform.trim().toLowerCase() == 'ios') {
      return widget.demonstrationMode
          ? showCodeButton(
              context,
              CupertinoSwitch(
                onChanged:
                    widget.disabledByDefault ? null : (_) => _toggleSwitcher(),
                value: _enable,
              ))
          : CupertinoSwitch(
              onChanged:
                  widget.disabledByDefault ? null : (_) => _toggleSwitcher(),
              value: _enable,
            );
    }
    if (widget.platform.trim().toLowerCase() == 'ios') {
      return widget.demonstrationMode
          ? showCodeButton(
              context,
              Switch(
                value: _enable,
                onChanged: widget.disabledByDefault
                    ? null
                    : (value) => _toggleSwitcher(),
              ))
          : Switch(
              value: _enable,
              onChanged: widget.disabledByDefault
                  ? null
                  : (value) => _toggleSwitcher(),
            );
    }
    return widget.demonstrationMode
        ? showCodeButton(
            context,
            Switch(
              value: _enable,
              onChanged: widget.disabledByDefault
                  ? null
                  : (value) => _toggleSwitcher(),
            ))
        : Switch(
            value: _enable,
            onChanged:
                widget.disabledByDefault ? null : (value) => _toggleSwitcher(),
          );
  }
}
