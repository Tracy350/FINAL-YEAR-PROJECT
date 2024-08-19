import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SearchFieldController extends ChangeNotifier {
  bool isSearchClicked = false;

  void toggleSearchPage() {
    isSearchClicked = !isSearchClicked;
    notifyListeners();
  }

  void resetSearchPage() {
    isSearchClicked = false;
    notifyListeners();
  }
}
