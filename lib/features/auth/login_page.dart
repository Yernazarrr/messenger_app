import 'package:flutter/material.dart';
import 'package:messenger_app/widgets/widgets.dart';
import 'package:messenger_app/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Неправильный пароль или почта'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.message,
                size: 100,
                color: Colors.grey[800],
              ),

              const SizedBox(height: 40),
              //Приветствие
              const Text(
                'С возращением!',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              //Поля для почты
              MyTextField(
                controller: emailController,
                hintText: 'Электронный адрес',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //Поля для пароля
              MyTextField(
                controller: passwordController,
                hintText: 'Пароль',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              //Кнопка Войти
              MyButton(onTap: signIn, text: 'Войти'),
              const SizedBox(height: 25),

              //Кнопки Зарегистрироваться
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Еще нет аккаунта?',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
