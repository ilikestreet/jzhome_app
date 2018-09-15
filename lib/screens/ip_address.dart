import 'package:flutter/material.dart';
import 'package:jzhome_app/ip_address_list/list.dart';

class IpAddress extends StatelessWidget {

  IpAddress();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ip Address'),
      ),
      body: new IpAddressList(),
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: () => _openAddItemDialog(context),
      //   child: new Icon(Icons.add),
      // ),
      // endDrawer: new Container(
      //     width: 240.0,
      //     color: Colors.white,
      //     child: new ReduxDevTools(store)),
    );
  }
}