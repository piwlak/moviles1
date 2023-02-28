import 'package:flutter/material.dart';
import 'package:moviles1/provider/theme_provider.dart';
import 'package:moviles1/routes.dart';
import 'package:moviles1/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

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
    return Sizer(
        builder: (context, orientation, devicetype) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme.getthemeData(),
              onGenerateRoute: MyRoutes.generatroute,
              initialRoute: Route_login,
              //routes: getApplicationRoutes(),
              home: SplashScreen(
                title: 'hi',
              ),
            ));
  }
}
