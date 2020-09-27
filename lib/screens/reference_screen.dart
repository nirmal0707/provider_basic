import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/my_model.dart';

void main() => runApp(ReferenceScreen());

class ReferenceScreen extends StatefulWidget {
  @override
  _ReferenceScreenState createState() => _ReferenceScreenState();
}

class _ReferenceScreenState extends State<ReferenceScreen> {
  final TextEditingController textCtrl = new TextEditingController();

  String msg = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: textCtrl,
            onSubmitted: (text) {
              setState(() {
                msg = text;
              });
            },
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.green[200],
            child: Consumer<MyModel>(
              builder: (context, myModel, child) {
                return RaisedButton(
                  child: Text('Do something'),
                  onPressed: () {
                    myModel.doSomething(msg);
                    textCtrl.clear();
                  },
                );
              },
            ),
          ),
          Consumer<MyModel>(
            builder: (context, myModel, child) {
              return Expanded(
                child: ListView.builder(
                    itemCount: myModel.items.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return ListTile(
                        title: Text(myModel.items[index]),
                      );
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
