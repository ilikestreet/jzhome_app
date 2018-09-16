import 'package:flutter/material.dart';
import 'package:jzhome_app/screens/ip_address.dart';
import 'package:jzhome_app/screens/sigin.dart';

class JzHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'JzHome',
      theme: ThemeData.dark(),
        initialRoute: "/",
        routes: <String, WidgetBuilder>{
          '/': (context) => new SignInScreen(),
          '/home': (context) => new IpAddress()
        }
    );
  }
}


 