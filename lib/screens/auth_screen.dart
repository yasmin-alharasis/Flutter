import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/auth_form.dart';

enum AuthType { login , register }

class AuthScreen extends StatelessWidget {
  final AuthType authType;

  const AuthScreen({Key key, this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 70),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                              'PandoSoft',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2
                              )
                          ),
                        ),
                        Image.asset(
                            'assets/images/logo.png' ,
                            height: 190
                        ),
                      ],
                    ),
                  )
                ],
              ),

              AuthForm(authType: authType),
            ],
          ),
        )
    );
  }
}
