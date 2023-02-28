import 'package:flutter/material.dart';

class Appbar_Widget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Profile Page",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      elevation: 0.5,
      iconTheme: IconThemeData(color: Colors.white),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              ThemeData().primaryColorLight,
              Theme.of(context).primaryColor,
            ])),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(
            top: 16,
            right: 16,
          ),
          child: Stack(
            children: <Widget>[
              Icon(Icons.notifications),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
