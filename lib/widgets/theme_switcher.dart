import 'package:flutter/material.dart';
import 'package:moviles1/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../settings/styles_settings.dart';

class ThemeSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    const double _containerWidth = 450.0;
    return Scaffold(
      body: SizedBox(
        height: (_containerWidth - (17 * 2) - (10 * 2)) / 3,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          children: List.generate(
            3,
            (i) {
              return GestureDetector(
                /*onTap: _isSelectedTheme
                    ? themeProvider.setthemeData(
                        theme.setthemeData(StyleSettings.DarkTheme(context)))
                    : () => themeProvider.setthemeData(theme
                        .setthemeData(StyleSettings.personaltheme(context))),*/
                child: AnimatedContainer(
                  height: 100,
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    /*color: _isSelectedTheme
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,*/
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).cardColor.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
