import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  get context => null;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No existe usuario con ese email');
      } else if (e.code == 'wrong-password') {
        print('Contraseña erronea');
      }
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print("Ya existe el email " + email);
      } else if (e.code == 'weak-password') {
        print('Password muy débil');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> singOut() async {
    return await _firebaseAuth.signOut();
  }
}
