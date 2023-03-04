import 'package:flutter/material.dart';
import 'package:moviles1/pages/loginpage.dart';
import 'package:moviles1/screen/forgot_password_page.dart';
import 'package:moviles1/screen/forgot_password_verification_page.dart';
import 'package:moviles1/screen/LoginPageMobile.dart';
import 'package:moviles1/screen/profile_page.dart';
import 'package:moviles1/screen/registration_page.dart';
import 'package:moviles1/screen/splash_screen.dart';
import 'package:moviles1/screen/onBoardScreen.dart';
import 'package:moviles1/screen/settings_page.dart';

/*Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => RegistrationPage(),
    '/dash': (BuildContext context) => DashboradScreen()
  };
}*/

const String Route_login = '/login';
const String Route_profile = '/profile';
const String Route_registration = '/registration';
const String Route_forgotPass = '/forgotPass';
const String Route_verificationPass = '/verificationPass';
const String Route_SplasScreen = '/SplashScreen';
const String Route_OnBoardScreen = '/onBoard';
const String Route_Settings = '/Settings';

class MyRoutes {
  static Route<dynamic> generatroute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/registration':
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case '/forgotPass':
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case '/SplashScreen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/verificationPass':
        return MaterialPageRoute(
            builder: (_) => ForgotPasswordVerificationPage());
      case '/onBorard':
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case '/Settings':
        return MaterialPageRoute(builder: (_) => Settings());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
