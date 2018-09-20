import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';

final port = 8088;
final String domain = "http://aliyun.ga-me.win:$port/";
final apiURL = domain + "api/";

bool isDarkTheme = true;
bool isLoggedIn = false;
double textScaleFactor = 1.0;
bool isBioSetup = false;
bool logoutFromMenu = false;
bool stayLoggedIn = true;

String errorMessage = "";

String id = "0";
String firstname = "Test";
String lastname = "Test";
String avatar =
    "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg";

User currentUser;

class User {
  final String id, avatar;

  String token;

  User({this.token, this.avatar, this.id});

  @override
  String toString() {
    return "firstname = $firstname lastname = $lastname token = $token"
        .toString();
  }
}

enum AlertAction {
  cancel,
  discard,
  disagree,
  agree,
}

class Utility {
  static void showAlertPopup(
      BuildContext context, String title, String detail) async {
    void showDemoDialog<T>({BuildContext context, Widget child}) {
      showDialog<T>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => child,
      );
    }

    return showDemoDialog<Null>(
        context: context,
        child: NativeDialog(
          title: title,
          content: detail,
          actions: <NativeDialogAction>[
            NativeDialogAction(
                text: 'OK',
                isDestructive: false,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ));
  }

  static Future<String> getData(String requestURL, Map params) async {
    print("Request URL: " + requestURL);
    print("params " + params.toString());

    var url = requestURL;
    var httpClient = new HttpClient();
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        try {
          var json = await response.transform(utf8.decoder).join();
          result = json;
        } catch (exception) {
          result = 'Error Getting Data';
        }
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    print("Result: " + result);
    return result;
  }

  static Future<String> postData(String requestURL, Map body) async {
    print("Request URL: " + requestURL);
    print("body " + body.toString());

    var url = requestURL;
    var httpClient = new HttpClient();
    String result;
    try {
      var request = await httpClient.postUrl(Uri.parse(url));

      request.headers.set('Content-Type', 'application/json');
      var jsonString = json.encode(body);
      request.add(utf8.encode(jsonString));

      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        try {
          var json = await response.transform(utf8.decoder).join();
          result = json;
        } catch (exception) {
          result = 'Error Getting Data';
        }
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    print("Result: " + result);
    return result;
  }
}
