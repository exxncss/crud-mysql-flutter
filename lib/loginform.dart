import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';
import 'dart:async';
import 'dart:convert';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => new _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController controllerusername = new TextEditingController();
  TextEditingController controllerpassword = new TextEditingController();

  void error(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage("images/login.png")),
                Text(
                  "Login Form",
                  style: TextStyle(fontFamily: "Netflix", fontSize: 20),
                ),
                new TextField(
                  controller: controllerusername,
                  style: TextStyle(fontFamily: "Netflix"),
                  decoration: new InputDecoration(
                      hintText: "Username", labelText: "Username"),
                ),
                new TextField(
                  style: TextStyle(fontFamily: "Netflix"),
                  controller: controllerpassword,
                  obscureText: true,
                  enableSuggestions: false,
                  decoration: new InputDecoration(
                      hintText: "Password", labelText: "Password"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: new RaisedButton(
                    onPressed: () {
                      if (controllerusername.value.text == 'admin' &&
                          controllerpassword.value.text == 'admin') {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                        // _sendDataToSecondScreen(context);
                      } else if (controllerusername.value.text == 'ikhsan' &&
                          controllerpassword.value.text == 'ikhsan') {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                        // _sendDataToSecondScreen(context);
                      } else if (controllerusername.value.text == 'fathur' &&
                          controllerpassword.value.text == 'fathur') {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                        // _sendDataToSecondScreen(context);
                      }else {
                        error(context, "Username dan password salah!");
                      }
                    },
                    child: new Text(
                      "Login",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// void _sendDataToSecondScreen(BuildContext context) {
//     String textToSend = controllerusername.text;
//     Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomePage(text: textToSend,),
//         ));
//   }
}
