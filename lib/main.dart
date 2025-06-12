import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final login = _loginController.text.trim();
    final password = _passwordController.text.trim();

    if (login.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha login e senha')),
      );
      return;
    }

    // Validação hardcoded: só aceita login 'admin' e senha '1234'
    if (login == 'admin' && password == '1234') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login realizado com sucesso!')),
      );
      // Aqui você pode navegar para outra tela, por exemplo:
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login ou senha incorretos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portal Unitins - Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(
                labelText: 'Login',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
