import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constans.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String email = '';
  String password = '';
  String errorMsg = '';
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign In Into Brew Cerew'),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Sign Up'),
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) {
                          if (val.isEmpty)
                            return 'Email tidak boleh dikosongkan.';
                          return null;
                        },
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) {
                          if (val.isEmpty)
                            return 'Pasword tidak boleh dikosongkan.';
                          if (val.length < 6)
                            return 'Pasword tidak boleh kurang dari 6 karakter.';
                          return null;
                        },
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => isLoading = true);
                            dynamic result = await _auth.signInEmailPassword(
                                email, password);
                            if (result == null) {
                              setState(() {
                                errorMsg = 'Credential not found.';
                                isLoading = false;
                              });
                            }
                          }
                        },
                        color: Colors.pink[400],
                        child: Text('Sign In',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 15.0),
                      Text(errorMsg,
                          style: TextStyle(color: Colors.red, fontSize: 14.0))
                    ],
                  ),
                )),
          );
  }
}
