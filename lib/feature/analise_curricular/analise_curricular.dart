import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class AnaliseCurricularScreen extends StatelessWidget {
  final List<Map<String, String>> dados = [
    {
      "nome": "KATRINA DE MORAIS SANTOS",
      "curso": "SISTEMAS DE INFORMAÇÃO",
      "status": "Matriculado"
    },
    {
      "nome": "KATRINA DE MORAIS SANTOS",
      "curso": "SISTEMAS DE INFORMAÇÃO",
      "status": "Transferência de Grade"
    },
    {
      "nome": "KATRINA DE MORAIS SANTOS",
      "curso": "ADMINISTRAÇÃO",
      "status": "Matrícula Especial"
    },
  ];

  Future<void> _abrirPdfViewer(BuildContext context) async {
    final ByteData data = await rootBundle.load('assets/AnaliseCurricular.pdf');
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/sample.pdf');

    await file.writeAsBytes(data.buffer.asUint8List());

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PDFViewerScreen(filePath: file.path)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Análise Curricular')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 600),
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                    columns: const [
                      DataColumn(label: Text('Nome')),
                      DataColumn(label: Text('Curso')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Ação')),
                    ],
                    rows: dados.map((item) {
                      return DataRow(cells: [
                        DataCell(Text(item['nome']!)),
                        DataCell(Text(item['curso']!)),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: item['status'] == 'Aprovado'
                                  ? Colors.green[100]
                                  : item['status'] == 'Em andamento'
                                      ? Colors.orange[100]
                                      : Colors.red[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              item['status']!,
                              style: TextStyle(
                                color: item['status'] == 'Aprovado'
                                    ? Colors.green[800]
                                    : item['status'] == 'Em andamento'
                                        ? Colors.orange[800]
                                        : Colors.red[800],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.show_chart, color: Colors.blue),
                            onPressed: () => _abrirPdfViewer(context),
                          ),
                        ),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PDFViewerScreen extends StatelessWidget {
  final String filePath;

  const PDFViewerScreen({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visualizador de PDF')),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}