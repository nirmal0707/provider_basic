import 'package:flutter/material.dart';

class SelectedListScreen extends StatefulWidget {
  SelectedListScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SelectedListScreenState createState() => _SelectedListScreenState();
}

class _SelectedListScreenState extends State<SelectedListScreen> {
  bool rememberMe = false;
  List<String> items = [];
  var litems = <Map>[];
  final TextEditingController textCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('abababa'),
      ],
    );
  }
}
