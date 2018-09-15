import 'package:flutter/material.dart';
import 'package:jzhome_app/screens/ip_address.dart';
import 'package:jzhome_app/screens/auth.dart';

class JzHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'JzHome',
      theme: ThemeData.dark(),
      home: new AuthScreen(),
    );
  }
}


 