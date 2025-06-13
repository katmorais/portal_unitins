import 'package:flutter/material.dart';
import 'package:portal_unitins/feature/secretaria/secretaria_card.dart';
import 'package:portal_unitins/feature/boletim/boletim.dart';
import 'package:portal_unitins/feature/matriz_curricular/matriz_curricular.dart';
import 'package:portal_unitins/feature/rematricula/rematricula.dart';

import '../analise_curricular/analise_curricular.dart';
import '../situacao_academica/situacao_academica.dart';

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
            Text("Katrina"),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Secretaria',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            SecretariaCard(
              titulo: 'BOLETIM (SEMESTRE ATUAL)',
              descricao: 'Desempenho nas disciplinas do semestre atual.',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AcademicBulletinScreen(),
                  ),
                );
              },
            ),
            SecretariaCard(
              titulo: 'GRADE CURRICULAR',
              descricao: 'Selecione um curso e veja as disciplinas distribuídas por período.',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MatrizCurricularScreen(),
                  ),
                );
              },
            ),
            SecretariaCard(
              titulo: 'REMATRÍCULA ONLINE',
              descricao: 'Fazer a rematrícula nos semestres posteriores, conforme calendário acadêmico.',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RematriculaScreen(),
                  ),
                );
              },
            ),
            SecretariaCard(
              titulo: 'SITUAÇÃO ACADÊMICA',
              descricao: 'Veja a sua situação junto à secretaria e demais departamentos da Unitins.',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SituacaoAcademicaPage(),
                  ),
                );
              },
            ),
            SecretariaCard(
              titulo: 'ANÁLISE CURRICULAR',
              descricao: 'Análise curricula completa.',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AnaliseCurricularScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
