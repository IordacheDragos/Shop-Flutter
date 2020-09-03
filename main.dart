import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:invat/auth.dart';
import 'package:provider/provider.dart';
import 'homescreenprovider.dart';
import 'registerpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("E-commerce"),
      ),
      body: MyHomePage(),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = '';
  String pass = '';
  final Autentificare _auth = new Autentificare();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenProvider>(
      create: (context) => HomeScreenProvider(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.yellowAccent,
              child: Consumer<HomeScreenProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      SizedBox(height: 300),
                      new Expanded(
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          physics: ClampingScrollPhysics(),
                          children: <Widget>[
                            SizedBox(height: 10),
                            Container(
                              width: 250,
                              child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  decoration: InputDecoration(
                                    fillColor: Colors.black,
                                    hintText: 'E-mail',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        decorationColor: Colors.black),
                                  ),
                                  onChanged: (value) {
                                    email = value;
                                  }),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 250,
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                decoration: InputDecoration(
                                  fillColor: Colors.black,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      decorationColor: Colors.black),
                                ),
                                onChanged: (value) {
                                  pass = value;
                                },
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                              width: 100,
                              height: 50,
                              child: RawMaterialButton(
                                onPressed: () async {
                                  _auth.signInWithEmailAndPassword(
                                      email, pass, context);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    side: BorderSide(
                                        color: Colors.black, width: 1.5)),
                                child: Text('Login',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black)),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                              width: 100,
                              height: 50,
                              child: RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPage()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    side: BorderSide(
                                        color: Colors.black, width: 1.5)),
                                child: Text('Register',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              )),
        );
      }),
    );
  }
}
