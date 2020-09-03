import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenProvider extends ChangeNotifier {
  String _email = '';
  String ModifyEmail(String mail) {
    _email = mail;
    notifyListeners();
  }

  String get email => _email;
}
