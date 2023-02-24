import 'package:flutter/widgets.dart';
import 'package:moviles1/screen/dashboard_screen.dart';
import 'package:moviles1/screen/registration_page.dart';
import 'package:moviles1/screen/registration_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => RegistrationPage(),
    '/dash': (BuildContext context) => DashboradScreen()
  };
}
