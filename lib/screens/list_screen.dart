import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/list_provider.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController textCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var productsData = Provider.of<CartModel>(context);
    var products = productsData.items;
    var map = {};

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: textCtrl,
                onSubmitted: (text) {
                  setState(() {
                    map['item_name'] = text;
                    map['item_status'] = false;
                    print('ffff');
                  });
                },
              ),
            ),
            RaisedButton(
              color: Colors.pink,
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print('dddd');
                productsData.addItem(map['item_name'],map['item_status']);
                textCtrl.clear();
              },
            )
          ],
        ),
        Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return ListTile(
                    title: Text(products[index].item_name),
                    trailing: Checkbox(
                        value: products[index].item_status,
                        onChanged: (value) {
                          setState(() {
                            products[index].item_status = value;
                          });
                        }),
                  );
                }))
      ],
    );
  }
}
