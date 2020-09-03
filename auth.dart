import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invat/shoppage.dart';

class Autentificare {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user;
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Successfully registered')));
    } on FirebaseAuthException catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ShopPage()));
    } on FirebaseAuthException catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future signOut() {
    try {
      _auth.signOut();
    } catch (e) {
      print('muie' + e.toString());
    }
  }
}
