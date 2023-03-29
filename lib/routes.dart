// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:moviles1/pages/loginpage.dart';
import 'package:moviles1/screen/MovieDetail.dart';
import 'package:moviles1/screen/PopularVideos.dart';
import 'package:moviles1/screen/add_post.dart';
import 'package:moviles1/screen/forgot_password_page.dart';
import 'package:moviles1/screen/forgot_password_verification_page.dart';
import 'package:moviles1/screen/profile_page.dart';
import 'package:moviles1/screen/registration_page.dart';
import 'package:moviles1/screen/splash_screen.dart';
import 'package:moviles1/screen/onBoardMobile.dart';
import 'package:moviles1/screen/settings_page.dart';
import 'package:moviles1/screen/screenMobileEvents.dart';

const String Route_login = '/login';
const String Route_profile = '/profile';
const String Route_registration = '/registration';
const String Route_forgotPass = '/forgotPass';
const String Route_verificationPass = '/verificationPass';
const String Route_SplasScreen = '/SplashScreen';
const String Route_OnBoardScreen = '/onBoard';
const String Route_Settings = '/Settings';
const String Route_Add = '/Add';
const String Route_Calendar = '/Calendar';
const String Route_Api = '/Api';
const String Route_Modify = '/modify';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/Add': (BuildContext context) => AddPost(
          objpost: null,
        ),
    '/login': (BuildContext context) => LoginPage(),
    '/profile': (BuildContext context) => ProfilePage(),
    '/registration': (BuildContext context) => RegistrationPage(),
    '/forgotPass': (BuildContext context) => ForgotPasswordPage(),
    '/SplashScreen': (BuildContext context) => SplashScreen(),
    '/verificationPass': (BuildContext context) =>
        ForgotPasswordVerificationPage(),
    '/onBorard': (BuildContext context) => OnboardingPage(),
    '/Settings': (BuildContext context) => ThemeSettings(),
    '/Calendar': (BuildContext context) => EventosScreen(),
    '/Api': (BuildContext context) => PopulaMoviesScreen(),
    '/movie': (BuildContext context) => MovieDetail(),
  };
}
