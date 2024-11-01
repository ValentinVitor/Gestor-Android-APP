import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InventoryScreen(),
    );
  }
}

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Gestor',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIconButton(Icons.home, 'HOME'),
                  SizedBox(width: 20),
                  _buildIconButton(Icons.bar_chart, 'INVENTÁRIO'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Cadastro',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildDataTable(),
              SizedBox(height: 10),
              Center(
                child: Text('1  2  3', style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 20),
              Text(
                'Comentários:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildCommentsSection(),
              SizedBox(height: 20),
              _buildSupportSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 50),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildDataTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Id')),
        DataColumn(label: Text('Categ.')),
        DataColumn(label: Text('Nome')),
        DataColumn(label: Text('Marca')),
        DataColumn(label: Text('Qnt.')),
        DataColumn(label: Text('Valor Total')),
        DataColumn(label: Text('Data Compra')),
        DataColumn(label: Text('Val.')),
        DataColumn(label: Text('')),
      ],
      rows: List<DataRow>.generate(
        10,
            (index) => DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Limpeza')),
          DataCell(Text('Detergente')),
          DataCell(Text('Ypê')),
          DataCell(Text('10')),
          DataCell(Text('45.00')),
          DataCell(Text('19/04/2004')),
          DataCell(Text('24/04/2005')),
          DataCell(Icon(Icons.delete, color: Colors.black)),
        ]),
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Column(
      children: [
        _buildCommentCard('Necessário compra de desinfetante, estoque baixo.'),
        _buildCommentCard('Sem compras de alimentos da marca: ABCD.'),
        _buildCommentCard('Atenção ao controle de custos!'),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Adicione um comentário/alerta',
          ),
          maxLines: 3,
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Adicionar'),
          ),
        ),
      ],
    );
  }

  Widget _buildCommentCard(String comment) {
    return Card(
      color: Colors.grey[200],
      child: ListTile(
        leading: Icon(Icons.warning, color: Colors.black),
        title: Text(comment),
        trailing: Icon(Icons.delete, color: Colors.black),
      ),
    );
  }

  Widget _buildSupportSection() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.help_outline, size: 40),
            SizedBox(width: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Algum Problema?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Entre em contato conosco sobre qualquer problema:',
                ),
                Text(
                  'gestor@suporte.com',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
