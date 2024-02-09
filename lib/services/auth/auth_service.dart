import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  //Экземпляр FirebaseAuth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //экземпляп Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Регистрация пользователя
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firestore.collection('users').doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
        SetOptions(merge: true),
      );

      return userCredential;
    }
    // Ловим исключение
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Создание нового пользователя
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //после создания каждого нового пользователя,
      //создаем новый документ в коллекции пользователей
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Выйти из аккаунта
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
