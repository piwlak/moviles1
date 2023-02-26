import 'package:flutter/material.dart';
import 'package:moviles1/provider/theme_provider.dart';
import 'package:moviles1/routes.dart';
import 'package:provider/provider.dart';
import 'screen/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(context)),
      ],
      child: PMSNApp(),
    );
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getthemeData(),
      routes: getApplicationRoutes(),
      home: LoginPage(),
    );
  }
}
