import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_prefs.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void getMostRecentSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesAsString =
        prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
    mostRecentList = mostRecentIndicesAsString
        .map((element) => int.parse(element))
        .toList();
    notifyListeners();
  }
}
