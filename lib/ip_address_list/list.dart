import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jzhome_app/ip_address_list/item.dart';
import 'package:jzhome_app/model/card_items.dart';

class IpAddressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, List<CartItem>>(
      converter: (store) => store.state,
      builder: (context, list) {
        return new ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, position) =>
                new IpAddressItem(list[position]));
      },
    );
  }
}