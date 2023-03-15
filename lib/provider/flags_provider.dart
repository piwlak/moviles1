import 'package:flutter/material.dart';

class FlagsProvider with ChangeNotifier {
  bool _flagpost = false;
  getflagpost() => _flagpost;
  setflagpost() {
    _flagpost = !_flagpost;
    notifyListeners();
  }
}
