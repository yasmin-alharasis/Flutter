import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth_screen.dart';
import 'package:flutter_app/widget/original_button.dart';
import 'package:flutter_app/services/auth.dart';

class AuthForm extends StatefulWidget {
  final AuthType authType;

  const AuthForm({Key key, @required this.authType}) : super(key: key);


  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';
  AuthBase authBase = AuthBase();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),

       child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                _email = value;
              },
              validator: (value) =>
              value.isEmpty ? 'You must enter a valid email' : null,
              decoration: InputDecoration(
                  labelText: 'Enter your Email',
                  hintText: 'ex: Test@gmail.com'
              ),
            ),

            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your Password',
              ),
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              validator: (value) => value.length <= 6
                  ? 'Your password must be larger than 6 characters'
                  : null,
            ),
            SizedBox(height: 20
            ),
            SizedBox(height: 25),
            OriginalButton(
                text: widget.authType == AuthType.login ? 'Login' : 'Register',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    if(widget.authType == AuthType.login) {
                      await authBase.loginWithEmailAndPassword(
                          _email, _password);
                      Navigator.of(context).pushReplacementNamed('home');
                    }
                    else
                    {
                      await authBase.registerWithEmailAndPassword(_email, _password);
                      Navigator.of(context).pushReplacementNamed('home');
                    }
                  }
                },
                textColor: Colors.white,
                bgColor: Colors.red[300]
            ),
              SizedBox(height: 5),
              FlatButton(
                onPressed:() {
                  if (widget.authType == AuthType.login) {
                    Navigator.of(context).pushReplacementNamed('register');
                    print(widget.authType);
                  }
                  else {
                    Navigator.of(context).pushReplacementNamed('login');
                  }
                },
                  child: Text(
                    widget.authType == AuthType.login
                        ? 'Don\'t have an account?'
                        : 'Already have an account?',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
