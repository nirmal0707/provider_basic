import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './list_screen.dart';
import './selected_list_screen.dart';
import '../providers/list_provider.dart';
import './reference_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageCtrl = PageController();

  bool rememberMe = false;
  List<String> items = [];
  var litems = <Map>[];
  final TextEditingController textCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ChangeNotifierProvider(
          create: (context) => CartModel(),
          child: PageView(
            scrollDirection: Axis.horizontal,
//          controller: pageCtrl,
            children: <Widget>[
              ReferenceScreen(),
              ListScreen(),
              SelectedListScreen(),
            ],
          ),
        ));
  }
}
