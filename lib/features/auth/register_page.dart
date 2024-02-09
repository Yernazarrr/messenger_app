import 'package:flutter/material.dart';
import 'package:messenger_app/widgets/widgets.dart';
import 'package:messenger_app/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //регистрация юзера
  void signUp() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Пароли не совпадают'),
          ),
        );
        return;
      } else {
        await authService.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
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
        child: SingleChildScrollView(
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

                //Приветствие
                const Text(
                  'Регистрация',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20),

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

                const SizedBox(height: 10),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Подтвердить пароль',
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                //Кнопка Войти
                MyButton(onTap: signUp, text: 'Создать аккаунт'),
                const SizedBox(height: 25),

                //Кнопки Зарегистрироваться
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Уже есть аккаунт?',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Войти',
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
      ),
    );
  }
}
