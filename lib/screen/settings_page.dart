import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';
import '../provider/provider.dart';

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
    final themecontroller = Get.put(Tema());
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Column(
          children: [
            Text(
              "Temas",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 750,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RadioListTile(
                    value: 1,
                    groupValue: _value,
                    onChanged: (val) {
                      setState(() {
                        _value = val!;
                      });
                      themecontroller.temaClaro();
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
                      themecontroller.temaOscuro();
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
                      themecontroller.temaPersonalizado(context);
                    },
                    title: Text('tema Personalizado'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

/*
               */