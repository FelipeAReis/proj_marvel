import 'package:flutter/material.dart';
import '../icons_social_icons.dart' as CustomIcon;



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Center(child: Text("Login no APP")),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 160,
                  height: 100,
                  child: Image.asset(
                    'assets/images/logo_color.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Usuario ou E-mail'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Insira o E-mail';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Senha',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Insira sua Senha';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.green,
                            onPressed: () { 
                              Navigator.pop(context);
                              return Navigator.of(context).pushNamed('/homePage');},
                            textColor: Colors.white,
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: <Widget>[
                          Expanded(child: Divider(color: Colors.grey)),
                          Text(
                            "   OU   ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Expanded(child: Divider(color: Colors.grey)),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.blue[900],
                            onPressed: () {
                              print('Login Facebook');
                            },
                            textColor: Colors.white,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                    Icon(CustomIcon.IconsSocial.facebook_squared),

                                  Text(
                                    'Login com Facebook',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.blue[200],
                            onPressed: () {
                              print('login com Twitter');
                            },
                            textColor: Colors.white,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                    Icon(CustomIcon.IconsSocial.twitter),

                                  Text(
                                    'Login com Twitter',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.deepOrange,
                            onPressed: () {
                              print('login com Google');
                            },
                            textColor: Colors.white,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                    Icon(CustomIcon.IconsSocial.google),

                                  Text(
                                    'Login com Google',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
