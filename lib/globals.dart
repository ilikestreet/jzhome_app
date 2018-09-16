String id = "0";
String firstname = "Test";
String lastname = "Test";
String avatar =
    "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg";

User currentUser;

class User {
  final String id, firstname, lastname, avatar;

  String token;

  User({this.token, this.avatar, this.firstname, this.id, this.lastname});

  @override
  String toString() {
    return "$firstname $lastname".toString();
  }
}
