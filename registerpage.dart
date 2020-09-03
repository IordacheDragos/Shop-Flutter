import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invat/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Register page"),
      ),
      body: MyRegisterPage(),
    ));
  }
}

class MyRegisterPage extends StatefulWidget {
  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final Autentificare _auth = Autentificare();
  String email = '';
  String pass = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellowAccent,
      child: Column(
        children: [
          SizedBox(height: 200),
          new Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Container(
                  width: 250,
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      hintText: 'E-mail',
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          decorationColor: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 250,
                  child: TextField(
                    onChanged: (value) {
                      pass = value;
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          decorationColor: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                  width: 100,
                  height: 50,
                  child: RawMaterialButton(
                    onPressed: () async {
                      _auth.registerWithEmailAndPassword(email, pass, context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        side: BorderSide(color: Colors.black, width: 1.5)),
                    child: Text('Register',
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                  width: 100,
                  height: 50,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        side: BorderSide(color: Colors.black, width: 1.5)),
                    child: Text('Login page',
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
