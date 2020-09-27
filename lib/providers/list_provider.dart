import 'package:flutter/material.dart';

import '../models/provider_model.dart';

class CartModel extends ChangeNotifier {
  List<ProviderModel> _items = [];

  List<ProviderModel> get items {
    if (_items == null) {
      _items=[];
    }
    return _items;
  }


  void addItem(String item_name, bool item_status) {
    ProviderModel item;
    item.item_name = item_name;
    item.item_status = item_status;
    _items.add(item);
    notifyListeners();
    print('hhhhhhhhh');
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  int itemCount() {
    return _items.length;
  }
}
