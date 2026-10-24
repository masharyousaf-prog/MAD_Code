import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myprovider extends ChangeNotifier {
  bool _isLight = true;

  ThemeData get theme => isLight ? ThemeData.light() : ThemeData.dark();
  bool get isLight => _isLight;

  Myprovider(){
    _fetchTheme();
  }

  Future<void> _fetchTheme() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _isLight = pref.getBool('isLight')?? true;
    notifyListeners();
  }

  Future<void> toggleTheme() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _isLight = !_isLight;
    await pref.setBool('isLight', _isLight);
    notifyListeners();
  }
}
