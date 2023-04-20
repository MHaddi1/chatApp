import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  String _msg = "";
  var _extra = "typing...";
  List<String> _messages = [];

  get extra => _extra;
  set Extra(String newExtra) {
    _extra = newExtra;
    notifyListeners();
  }

  get messages => _messages;

  set NewMsg(String newmsg) {
    _msg = newmsg;
    _messages.add(newmsg); // add new message to the list
    notifyListeners();
  }
}
