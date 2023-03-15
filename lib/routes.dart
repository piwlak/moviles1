// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:moviles1/pages/loginpage.dart';
import 'package:moviles1/screen/add_post.dart';
import 'package:moviles1/screen/forgot_password_page.dart';
import 'package:moviles1/screen/forgot_password_verification_page.dart';
import 'package:moviles1/screen/profile_page.dart';
import 'package:moviles1/screen/registration_page.dart';
import 'package:moviles1/screen/splash_screen.dart';
import 'package:moviles1/screen/onBoardMobile.dart';
import 'package:moviles1/screen/settings_page.dart';

const String Route_login = '/login';
const String Route_profile = '/profile';
const String Route_registration = '/registration';
const String Route_forgotPass = '/forgotPass';
const String Route_verificationPass = '/verificationPass';
const String Route_SplasScreen = '/SplashScreen';
const String Route_OnBoardScreen = '/onBoard';
const String Route_Settings = '/Settings';
const String Route_Add = '/Add';

class MyRoutes {
  static Route<dynamic> generatroute(RouteSettings settings) {
    switch (settings.name) {
      case '/Add':
        return MaterialPageRoute(builder: (_) => AddPost());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/registration':
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case '/forgotPass':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case '/SplashScreen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/verificationPass':
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordVerificationPage());
      case '/onBorard':
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case '/Settings':
        return MaterialPageRoute(builder: (_) => ThemeSettings());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
