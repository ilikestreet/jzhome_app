import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:jzhome_app/main.dart';
import 'package:jzhome_app/globals.dart' as globals;


class SignInScreen extends StatefulWidget {
  @override
  SignInScreenState createState() {
    return SignInScreenState();
  }
}

class SignInScreenState extends State<SignInScreen> {
  String _status = 'no-action';
  String _username, _password;
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

  Future<Null> _submit() async {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      final snackbar = SnackBar(
        duration: Duration(seconds: 30),
        content: Row(
          children: <Widget>[NativeLoadingIndicator(), Text("  Logging In...")],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
      print("username $_username");
      //TODO: add call sign in api in here
     appAuth
         .store(_username.toString().toLowerCase().trim(),
         _password.toString().trim())
         .then((onValue) {
       appAuth.login().then((result) {
         if (result) {
           Navigator.of(context).pushReplacementNamed('/home');
          //  Login.showTouchID(context); //Show Touch ID Once After Install
         } else {
           setState(() => this._status = 'rejected');
           globals.Utility
               .showAlertPopup(context, 'Info', globals.errorMessage);
         }
         if (!globals.isBioSetup) {
           setState(() {
             print('Bio No Longer Setup');
           });
         }
         _scaffoldKey.currentState.hideCurrentSnackBar();
       });
     });
    }
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
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (val) =>
                      val.length < 1 ? 'Username Required' : null,
                      onSaved: (val) => _username = val,
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
                      onSaved: (val) => _password = val,
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
                  onPressed: _submit
//                {
//                  print("username ${this._username}");
////                  Navigator.of(context).pushReplacementNamed("/home");
//                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}