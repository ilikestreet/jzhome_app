import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';

class AuthScreen extends StatefulWidget {
  @override
  AuthScreenState createState() {
    return AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {

  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _controllerUsername, _controllerPassword;

  @override
  initState() {
    rememberMe = true;
    super.initState();
  }

  bool rememberMe = false;

  void handelRememberMe(bool value) {
    setState(() {
      rememberMe = value;
//      widget.prefs.setBool('rememberMe', value);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          key: PageStorageKey("Divider 1"),
          children: <Widget>[
            SizedBox(
              height: 220.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
//                  child: Icon(
//                    Icons.person_pin,
//                    size: 175.0,
//                  )
              ),
            ),
            Form(
//              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (val) =>
                      val.length < 1 ? 'Username Required' : null,
//                      onSaved: (val) => _username = val,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      controller: _controllerUsername,
                      autocorrect: false,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (val) =>
                      val.length < 1 ? 'Password Required' : null,
//                      onSaved: (val) => _password = val,
                      obscureText: true,
                      controller: _controllerPassword,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Remember Me',
              ),
              trailing: NativeSwitch(
                onChanged: handelRememberMe,
                value: rememberMe,
              ),
            ),
            ListTile(
              title: NativeButton(
                child: Text(
                  'Login',
//                  textScaleFactor: globals.textScaleFactor,
                  style: TextStyle(color: Colors.white),
                ),
                minWidthAndroid: 220.0,
                buttonColor: Colors.blue,
                paddingExternal: const EdgeInsets.all(10.0),
                paddingInternal: const EdgeInsets.all(10.0),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/home");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}