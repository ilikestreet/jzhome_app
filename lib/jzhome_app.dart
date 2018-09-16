import 'package:flutter/material.dart';
import 'package:jzhome_app/screens/auth.dart';
import 'package:jzhome_app/screens/ip_address.dart';

class JzHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'JzHome',
      theme: ThemeData.dark(),
        initialRoute: "/",
        routes: <String, WidgetBuilder>{
          '/': (context) => new AuthScreen(),
          '/home': (context) => new IpAddress()
        }
    );
  }
}


 