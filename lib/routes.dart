import 'package:flutter/widgets.dart';
import 'package:moviles1/screen/dashboard_screen.dart';
import 'package:moviles1/screen/register_scene.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => RegisterScreen(),
    '/dash': (BuildContext context) => DashboradScreen()
  };
}
