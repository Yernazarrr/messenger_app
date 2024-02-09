import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/features/chat/chats_screen.dart';
import 'package:messenger_app/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //Если пользователь авторизован
          if (snapshot.hasData) {
            return const ChatsScreen();
          }
          //Если пользователь не авторизован
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
