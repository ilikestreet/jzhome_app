import 'package:flutter/material.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jzhome_app/jzhome_app.dart';
import 'package:jzhome_app/model/card_items.dart';
import 'package:jzhome_app/reducers/card_items_reducer.dart';
import 'package:jzhome_app/signin/auth_service.dart';

AuthService appAuth = new AuthService();

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final store = new DevToolsStore<List<CartItem>>(cartItemsReducer,
      initialState: new List());
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<List<CartItem>>(
      store: store,
      child: new JzHomeApp(),
    );
  }
}