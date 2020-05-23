import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login"
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }
}

signIn(String username, password) async {
  print(username);
  print(password);
  Map data = {'phone': username, 'password': password};
  var body = json.encode(data);
  var url = 'http://10.0.2.2:3000/user/login';
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

Container buttonSection() {
  return Container(
    child: RaisedButton(
        onPressed: () {
          if(usernameController.text != "" && passwordController.text != "")
            {
              signIn(usernameController.text, passwordController.text);
            }
          print('Login pressed');
              },
        child: Text('Log In'),

      ),
  );
}

final TextEditingController usernameController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();
Container textSection() {
  return Container(
    child: Column(
      children: <Widget>[
        // Username
        TextFormField(
          controller: usernameController,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter Username';
            }
            return null;
          },
        ),

        // Password
        TextFormField(
          controller: passwordController,
          obscureText: true,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter Password';
            }
            return null;
          },
        )

        // Login Button
      ],
    ),
  );
}

Container headerSection() {
  return Container(
    child: Text("Login"),
  );
}
