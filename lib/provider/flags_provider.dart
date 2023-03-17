import 'package:flutter/material.dart';

class FlagsProvider with ChangeNotifier {
  bool _flagpost = false;
  getflagpost() => this._flagpost;
  setflagpost() {
    this._flagpost = !_flagpost;
    notifyListeners();
  }
}
