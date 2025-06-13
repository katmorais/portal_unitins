import 'package:flutter/material.dart';

class MatrizCurricularScreen extends StatefulWidget {
  @override
  _MatrizCurricularScreenState createState() => _MatrizCurricularScreenState();
}

class _MatrizCurricularScreenState extends State<MatrizCurricularScreen> {
  final List<String> _cursos = [
    'Sistemas de Informação',
    'Ciência da Computação',
    'Engenharia de Software',
  ];

  String? _cursoSelecionado;

  // Exemplo de matriz curricular
  final Map<String, Map<int, List<String>>> _matrizData = {
    'Sistemas de Informação': {
      1: ['Introdução à Computação', 'Algoritmos e Lógica', 'Matemática Discreta', 'Comunicação e Expressão'],
      2: ['Estruturas de Dados', 'Programação Orientada a Objetos', 'Cálculo I', 'Organização de Computadores'],
      3: ['Banco de Dados I', 'Sistemas Operacionais', 'Engenharia de Software I', 'Probabilidade e Estatística'],
      4: ['Redes de Computadores', 'Banco de Dados II', 'Engenharia de Software II', 'Gestão de Projetos'],
      5: ['Projeto Integrador I', 'Gestão Estratégica da Informação', 'Inteligência Artificial', 'Segurança da Informação'],
      6: ['Sistemas Distribuídos', 'Tópicos Especiais em SI', 'Empreendedorismo', 'Ética e Legislação'],
      7: ['Estágio Supervisionado', 'Trabalho de Conclusão de Curso I', 'Optativa'],
      8: ['Trabalho de Conclusão de Curso II', 'Optativa'],
    },
    'Ciência da Computação': {
      1: ['Cálculo I', 'Algoritmos Avançados', 'Matemática Discreta', 'Introdução à Computação'],
      2: ['Álgebra Linear', 'Matemática Discreta II', 'Programação Estruturada', 'Física I'],
      3: ['Estruturas de Dados', 'Cálculo II', 'Física II', 'Teoria da Computação'],
      4: ['Banco de Dados', 'Sistemas Operacionais', 'Probabilidade e Estatística', 'Linguagens Formais'],
      5: ['Redes de Computadores', 'Compiladores', 'Engenharia de Software', 'Pesquisa Operacional'],
      6: ['Inteligência Artificial', 'Computação Gráfica', 'Sistemas Distribuídos', 'Métodos Numéricos'],
      7: ['Estágio Supervisionado', 'Trabalho de Conclusão de Curso I', 'Optativa'],
      8: ['Trabalho de Conclusão de Curso II', 'Optativa'],
    },
    'Engenharia de Software': {
      1: ['Fundamentos de Engenharia', 'Programação Básica', 'Matemática Discreta', 'Comunicação e Expressão'],
      2: ['Modelagem UML', 'Qualidade de Software', 'Cálculo I', 'Algoritmos e Estruturas de Dados'],
      3: ['Engenharia de Requisitos', 'Banco de Dados', 'Sistemas Operacionais', 'Gestão de Projetos'],
      4: ['Arquitetura de Software', 'Testes de Software', 'Redes de Computadores', 'Engenharia de Software Experimental'],
      5: ['Gerência de Configuração', 'Processos de Software', 'Empreendedorismo', 'Ética e Legislação'],
      6: ['Sistemas Distribuídos', 'Tópicos Especiais em ES', 'Segurança de Software', 'Interface Humano-Computador'],
      7: ['Estágio Supervisionado', 'Trabalho de Conclusão de Curso I', 'Optativa'],
      8: ['Trabalho de Conclusão de Curso II', 'Optativa'],
    },
  };

  @override
  Widget build(BuildContext context) {
    final matriz = _cursoSelecionado != null
        ? _matrizData[_cursoSelecionado] ?? {}
        : {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Matriz Curricular'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Selecione o curso',
                border: OutlineInputBorder(),
              ),
              value: _cursoSelecionado,
              items: _cursos
                  .map((curso) => DropdownMenuItem(
                value: curso,
                child: Text(curso),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _cursoSelecionado = value;
                });
              },
            ),
            SizedBox(height: 24),
            Expanded(
              child: _cursoSelecionado == null
                  ? Center(
                child: Text(
                  'Por favor, selecione um curso acima.',
                  style: TextStyle(fontSize: 16),
                ),
              )
                  : ListView(
                children: matriz.entries.map((entry) {
                  final periodo = entry.key;
                  final disciplinas = entry.value;
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${periodo}º Período',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          ...disciplinas.map(
                                (disc) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0),
                              child: Text(disc),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
