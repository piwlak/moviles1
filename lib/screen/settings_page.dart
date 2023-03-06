import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/theme_provider.dart';
import '../provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  late SharedPreferences preferences;
  int? _value = null;

  void initState() {
    cargarPreferencias().then((value) => cargar());

    super.initState();
  }

  void cargar() {
    if (_value == null) {
      _value = preferences.setInt("RB", 1) as int?;
    } else {
      _value = preferences.getInt("RB");
    }
    super.initState();
  }

  Future<void> cargarPreferencias() async {
    preferences = await Get.putAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
  }

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
                      preferences.setInt("RB", 1);
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
                      preferences.setInt("RB", 2);
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
                      themecontroller.temaPersonalizado();
                      preferences.setInt("RB", 3);
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