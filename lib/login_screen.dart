import 'package:flutter/material.dart';
import 'secretaria_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Image(
                image: AssetImage('assets/unitins_logo.png'), // coloque sua logo
                height: 60,
              ),
              const SizedBox(height: 20),
              const Text(
                'Portal do Aluno',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Acesse utilizando seu e-mail institucional:',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'E-mail (unitins.br)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecretariaScreen()),
                  );
                },
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
