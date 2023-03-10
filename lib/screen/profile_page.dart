import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moviles1/routes.dart';
import 'package:moviles1/provider/theme_provider.dart';
import 'package:moviles1/screen/list_post.dart';
import 'package:provider/provider.dart';
import 'splash_screen.dart';
import '../widgets/header_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('SocialiTec'),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).colorScheme.background.withOpacity(0.2),
                Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ])),
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://static-cdn.jtvnw.net/jtv_user_pictures/9ee71df5-13f1-4148-b1fd-3a089e4e2cfc-profile_image-70x70.png'),
                  ),
                  accountName: Text('Lorena'),
                  accountEmail: Text('LorenaOlalde@gmail.com')),
              ListTile(
                leading: Icon(Icons.screen_lock_landscape_rounded,
                    size: _drawerIconSize,
                    color: Theme.of(context).colorScheme.onSecondary),
                title: Text(
                  'Splash Screen',
                  style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
                height: 1,
              ),
              ListTile(
                leading: Icon(Icons.person_add_alt_1,
                    size: _drawerIconSize,
                    color: Theme.of(context).colorScheme.onSecondary),
                title: Text(
                  'Registration Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Route_registration);
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.password_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                title: Text(
                  'Forgot Password Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Route_forgotPass);
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.verified_user_sharp,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                title: Text(
                  'Verification Page',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Route_verificationPass);
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: _drawerFontSize,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Route_Settings);
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ListPost(),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, Route_Add).then((value) {
              setState(() {});
            });
          },
          label: Text('Add')),
    );
  }
}
