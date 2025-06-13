import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcademicBulletinApp extends StatelessWidget {
  const AcademicBulletinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boletim Acadêmico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AcademicBulletinScreen(),
    );
  }
}

class AcademicBulletinScreen extends StatelessWidget {
  const AcademicBulletinScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> _disciplines = const [
    {
      'disciplina': 'CÁLCULO DIFERENCIAL E INTEGRAL',
      'faltas': '2',
      'a1': '7.5',
      'a2': '8.0',
      'media': '7.8',
      'situacao': 'APROVADO',
    },
    {
      'disciplina': 'ELABORAÇÃO E GESTÃO DE PROJETOS',
      'faltas': '0',
      'a1': '9.0',
      'a2': '8.5',
      'media': '8.8',
      'situacao': 'APROVADO',
    },
    {
      'disciplina': 'ENGENHARIA DE QUALIDADE',
      'faltas': '1',
      'a1': '6.0',
      'a2': '7.0',
      'media': '6.5',
      'situacao': 'APROVADO',
    },
    {
      'disciplina': 'ESTATÍSTICA COMPUTACIONAL',
      'faltas': '3',
      'a1': '5.5',
      'a2': '6.0',
      'media': '5.8',
      'situacao': 'RECUPERAÇÃO',
    },
    {
      'disciplina': 'FUNDAMENTOS DE SISTEMAS DE INFORMAÇÃO',
      'faltas': '0',
      'a1': '8.0',
      'a2': '8.5',
      'media': '8.3',
      'situacao': 'APROVADO',
    },
    {
      'disciplina': 'PROGRAMAÇÃO ORIENTADA A OBJETOS',
      'faltas': '4',
      'a1': '4.0',
      'a2': '5.0',
      'media': '4.5',
      'situacao': 'REPROVADO',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0057B8),
        elevation: 0,
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 16),
            Text(
              'Boletim Acadêmico - SISTEMAS DE INFORMAÇÃO',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Disciplinas do Semestre Letivo',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
            columns: const [
              DataColumn(label: Text('Disciplina')),
              DataColumn(label: Text('Faltas')),
              DataColumn(label: Text('A1')),
              DataColumn(label: Text('A2')),
              DataColumn(label: Text('Média')),
              DataColumn(label: Text('Situação')),
            ],
            rows: _disciplines.map((disc) {
              return DataRow(
                cells: [
                  DataCell(SizedBox(
                    width: 200,
                    child: Text(disc['disciplina'] ?? ''),
                  )),
                  DataCell(Text(disc['faltas']!)),
                  DataCell(Text(disc['a1']!)),
                  DataCell(Text(disc['a2']!)),
                  DataCell(Text(disc['media']!)),
                  DataCell(Text(disc['situacao']!)),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
