import 'package:flutter/widgets.dart';

class MyModel with ChangeNotifier{
  List<String> items=[];
  String someValue = 'Hello';
  void doSomething(String msg) {
    someValue = msg;
    items.add(msg);
    notifyListeners();
    print(items);
  }
}