import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../settings/styles_settings.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  int _value = 3;
  @override
  Widget build(BuildContext context) {
    const double _containerWidth = 450.0;
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RadioListTile(
              value: 1,
              groupValue: _value,
              onChanged: (val) {
                setState(() {
                  _value = val!;
                });
                theme.setthemeData(StyleSettings.lightTheme(context));
              },
              title: Text('tema claro'),
            ),
            RadioListTile(
              value: 2,
              groupValue: _value,
              onChanged: (val) {
                setState(() {
                  _value = val!;
                });
                theme.setthemeData(StyleSettings.DarkTheme(context));
              },
              title: Text('tema obscuro'),
            ),
            RadioListTile(
              value: 3,
              groupValue: _value,
              onChanged: (val) {
                setState(() {
                  _value = val!;
                });
                theme.setthemeData(StyleSettings.personaltheme(context));
              },
              title: Text('tema Personalizado'),
            ),
          ],
        ));
  }
}
