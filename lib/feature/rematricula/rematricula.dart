import 'package:flutter/material.dart';

class RematriculaScreen extends StatefulWidget {
  const RematriculaScreen({Key? key}) : super(key: key);

  @override
  State<RematriculaScreen> createState() => _RematriculaScreenState();
}

class _RematriculaScreenState extends State<RematriculaScreen> {
  final List<String> _disciplinas = [
    'Cálculo II',
    'Estruturas de Dados',
    'Banco de Dados',
    'Engenharia de Software',
    'Redes de Computadores',
    'Inteligência Artificial',
  ];

  final Set<String> _selecionadas = {};

  void _confirmarRematricula() {
    if (_selecionadas.length == 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Rematrícula feita com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) Navigator.of(context).pop();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selecione exatamente 4 disciplinas para rematrícula.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rematrícula Online'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecione até 4 disciplinas para rematrícula:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _disciplinas.map((disciplina) {
                  return CheckboxListTile(
                    title: Text(disciplina),
                    value: _selecionadas.contains(disciplina),
                    onChanged: (bool? checked) {
                      setState(() {
                        if (checked == true) {
                          if (_selecionadas.length < 4) {
                            _selecionadas.add(disciplina);
                          }
                        } else {
                          _selecionadas.remove(disciplina);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _confirmarRematricula,
                child: const Text('Confirmar Matrícula'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
