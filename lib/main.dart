import 'package:flutter/material.dart';
import 'package:moviles1/pages/loginpage.dart';
import 'package:moviles1/provider/flags_provider.dart';
import 'package:moviles1/routes.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FlagsProvider())],
      child: const PMSNApp(),
    );
  }
}

class PMSNApp extends StatefulWidget {
  const PMSNApp({super.key});

  @override
  State<PMSNApp> createState() => _PMSNAppState();
}

class _PMSNAppState extends State<PMSNApp> {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      defaultThemeId: "custom_theme",
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        AppTheme.light(),
        AppTheme(
            id: "dark_theme", // Id(or name) of the theme(Has to be unique)
            description: "My Custom Theme", // Description of theme
            data: ThemeData.from(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: const Color.fromARGB(255, 69, 4, 122),
                    onPrimary: const Color.fromARGB(255, 255, 255, 255),
                    background: const Color.fromARGB(255, 0, 0, 0),
                    onBackground: const Color.fromARGB(255, 255, 255, 255),
                    onSecondary: Color.fromARGB(255, 0, 13, 78),
                    onPrimaryContainer:
                        const Color.fromARGB(255, 7, 255, 234)))),
        AppTheme(
            id: "custom_theme", // Id(or name) of the theme(Has to be unique)
            description: "My Custom Theme", // Description of theme
            data: ThemeData.from(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Colors.pink,
                    onPrimary: const Color.fromARGB(255, 255, 255, 255),
                    background: const Color.fromARGB(255, 255, 255, 255),
                    onBackground: const Color.fromARGB(255, 0, 0, 0),
                    secondary: const Color.fromARGB(255, 163, 16, 231),
                    onSecondary: const Color.fromARGB(255, 221, 148, 255),
                    onPrimaryContainer: Colors.pink))),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Socialitec',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: MyRoutes.generatroute,
            initialRoute: Route_login,
            home: const LoginPage(),
          ),
        ),
      ),
    );
  }
}
