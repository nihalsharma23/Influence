import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                  ),
                  RaisedButton(
                    child: Text("Login"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // TODO: Perform login here
                        print("Email: ${_emailController.text}");
                        print("Password: ${_passwordController.text}");
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            GoogleSignInButton(
              onPressed: () {
                // TODO: Perform Google sign in here
                print("Google sign in");
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            FacebookSignInButton(
              onPressed: () {
                // TODO: Perform Facebook sign in here
                print("Facebook sign in");
              },
            ),
          ],
        ),
      ),
    );
  }
}
