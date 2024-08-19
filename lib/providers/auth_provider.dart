import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class EmailProvider extends ChangeNotifier {
  String _email = "";

  set setEmail(email) {
    _email = email;
    Logger().d(email);
    notifyListeners();
  }

  get getEmail => _email;
}

// EmailProvider emailProvider = EmailProvider();

