import 'package:flutter/material.dart';

class SituacaoAcademicaPage extends StatelessWidget {
  final documentos = [
    {"nome": "Foto", "obrigatorio": true, "entregue": false},
    {"nome": "Carteira de Identidade/RG", "obrigatorio": true, "entregue": true},
    {"nome": "Certidão de Nascimento/Casamento", "obrigatorio": true, "entregue": true},
    {"nome": "Histórico Escolar - Ensino Médio", "obrigatorio": true, "entregue": true},
    {"nome": "Certificado Militar/Reservista", "obrigatorio": false, "entregue": true},
    {"nome": "CPF (CIC)", "obrigatorio": true, "entregue": true},
    {"nome": "Diploma/Certificado Registrado", "obrigatorio": true, "entregue": true},
    {"nome": "Comprovante de Vacina", "obrigatorio": false, "entregue": true},
    {"nome": "Título de Eleitor", "obrigatorio": true, "entregue": true},
    {"nome": "Comprovante de Votação", "obrigatorio": true, "entregue": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SISTEMAS DE INFORMAÇÃO (Matriculado)"),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              "Situação Acadêmica",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            buildReadOnlyField("Nº de Matrícula", "2020201100100349"),
            buildReadOnlyField("Nome", "KARINA DE MORAIS SANTOS"),
            buildReadOnlyField("Curso", "SISTEMAS DE INFORMAÇÃO"),
            buildReadOnlyField("Situação", "Matriculado"),
            const SizedBox(height: 20),
            const Text("Documentos:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...documentos.map((doc) => buildDocumentoItem(doc)),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Você possui pendência de documento(s), favor procurar a secretaria.",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Voltar"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildReadOnlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        controller: TextEditingController(text: value),
      ),
    );
  }

  Widget buildDocumentoItem(Map doc) {
    final entregue = doc['entregue'] as bool;
    final obrigatorio = doc['obrigatorio'] as bool;
    final nome = doc['nome'] as String;

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(6),
        color: entregue ? Colors.green[50] : Colors.red[50],
      ),
      child: Row(
        children: [
          Icon(
            entregue ? Icons.check_circle : Icons.cancel,
            color: entregue ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "$nome ${obrigatorio ? "(Obrigatório)" : ""}",
              style: TextStyle(color: Colors.black87),
            ),
          )
        ],
      ),
    );
  }
}
