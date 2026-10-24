import 'package:flutter/material.dart';

class Counterprovider with ChangeNotifier{
  int _counter=0;
  bool _isLoading = false;

  int get counter => _counter;
  bool get isLoading => _isLoading;
  

  void increment(){
    _isLoading = true;
    notifyListeners();
    _counter++;

    _isLoading= false;
    notifyListeners();
  }

  void decrement(){
    _isLoading = true;
    notifyListeners();
    _counter--;

    _isLoading= false;
    notifyListeners();
  }
}