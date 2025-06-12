import 'package:flutter/material.dart';

class SecretariaScreen extends StatelessWidget {
  const SecretariaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 8),
            Text("Nome"),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            Text(
              'Secretaria',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            SecretariaCard(
              titulo: 'BOLETIM (SEMESTRE ATUAL)',
              descricao: 'Desempenho nas disciplinas do semestre atual.',
            ),
            SecretariaCard(
              titulo: 'GRADE CURRICULAR',
              descricao: 'Selecione um curso e veja as disciplinas distribuídas por período.',
            ),
            SecretariaCard(
              titulo: 'REMATRÍCULA ONLINE',
              descricao: 'Fazer a rematrícula nos semestres posteriores, conforme calendário acadêmico.',
            ),
            SecretariaCard(
              titulo: 'SITUAÇÃO ACADÊMICA',
              descricao: 'Veja a sua situação junto à secretaria e demais departamentos da Unitins.',
            ),
          ],
        ),
      ),
    );
  }
}

class SecretariaCard extends StatelessWidget {
  final String titulo;
  final String descricao;

  const SecretariaCard({
    super.key,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(descricao),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0052CC),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  // Ação do botão
                },
                child: const Text('Acessar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
