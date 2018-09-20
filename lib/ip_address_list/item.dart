import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jzhome_app/actions/item_action.dart';
import 'package:jzhome_app/model/card_items.dart';

class IpAddressItem extends StatelessWidget {
  final CartItem item;

  IpAddressItem(this.item);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, OnStateChanged>(
        converter: (store) {
      return (item) => store.dispatch(ToggleItemStateAction(item));
    }, builder: (context, callback) {
      return new ListTile(
        title: new Text(item.ip),
        leading: new Checkbox(
            value: item.checked,
            onChanged: (bool newValue) {
              callback(CartItem(item.ip, newValue));
            }),
      );
    });
  }
}

typedef OnStateChanged = Function(CartItem item);
