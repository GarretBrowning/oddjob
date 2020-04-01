import 'package:flutter/material.dart';
import 'package:oddjob/homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new MyLoginPage(),
        routes: {
          '/home_page': (context) => HomePage(),
        }
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => new _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(60.0, 170.0, 0.0, 0.0),
                  child: Text(
                    'OddJob',
                    style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold
                    ),
                  ),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrangeAccent)
                      )
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange)
                      )
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 5.0,),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top:15.0, left: 20.0),
                  child: InkWell(
                    child: Text('Forgot Password?',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline
                        )),
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 40.0, // button height
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.deepOrangeAccent,
                    color: Colors.deepOrange,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/home_page');
                      },
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 15.0
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.5
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
//                          child: ImageIcon(AssetImage('assets/facebook_logo.png')), // This looks bad so far... Revisit
                        ),
                        Center(
                          child: Text('Log in with Facebook',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'
                            ),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New to OddJob?',
                style: TextStyle(
                    fontFamily: 'Montserrat'
                ),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {},
                child: Text('Sign-Up!',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                  ),),
              )
            ],
          )
        ],
      ),
    );
  }
}