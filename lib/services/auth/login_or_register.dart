import 'package:flutter/material.dart';
import 'package:messenger_app/features/auth/login_page.dart';
import 'package:messenger_app/features/auth/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //Изначально показываем страницу авторизации
  bool showLoginPage = true;

  //Переключаем страницы Логин и Регистрации
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
