import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Gestor', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconButton(Icons.home, 'HOME'),
                  _buildIconButton(Icons.note_add, 'CADASTRO'),
                ],
              ),
              SizedBox(height: 20),
              _buildChartSection(),
              SizedBox(height: 20),
              _buildTableSection(),
              SizedBox(height: 20),
              _buildFooterSection(),
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
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildChartSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quantidade de Produtos por Mês',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.white,
          child: CustomPaint(
            painter: LineChartPainter(),
          ),
        ),
      ],
    );
  }

  Widget _buildTableSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produtos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoria')),
              DataColumn(label: Text('Nome')),
              DataColumn(label: Text('Marca')),
              DataColumn(label: Text('Quantidade')),
              DataColumn(label: Text('Valor Total')),
              DataColumn(label: Text('Data de Compra')),
              DataColumn(label: Text('Validade')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Limpeza')),
                DataCell(Text('Detergente')),
                DataCell(Text('Ype')),
                DataCell(Text('10')),
                DataCell(Text('45.00')),
                DataCell(Text('2024-04-19')),
                DataCell(Text('2032-06-02')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('Alimento')),
                DataCell(Text('Macarrão')),
                DataCell(Text('Redondinho')),
                DataCell(Text('30')),
                DataCell(Text('81.00')),
                DataCell(Text('2024-04-19')),
                DataCell(Text('2027-01-05')),
              ]),
              DataRow(cells: [
                DataCell(Text('3')),
                DataCell(Text('Limpeza')),
                DataCell(Text('Sabão')),
                DataCell(Text('Lulu')),
                DataCell(Text('2')),
                DataCell(Text('32.87')),
                DataCell(Text('2024-04-19')),
                DataCell(Text('2024-04-19')),
              ]),
              DataRow(cells: [
                DataCell(Text('45')),
                DataCell(Text('Educação')),
                DataCell(Text('Apostilas')),
                DataCell(Text('')),
                DataCell(Text('300')),
                DataCell(Text('1111.20')),
                DataCell(Text('2024-07-04')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('46')),
                DataCell(Text('Educação')),
                DataCell(Text('Livros')),
                DataCell(Text('')),
                DataCell(Text('570')),
                DataCell(Text('1211.20')),
                DataCell(Text('2024-06-01')),
                DataCell(Text('')),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooterSection() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.help_outline),
              SizedBox(width: 8),
              Text(
                'Algum Problema?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text('Entre em contato conosco sobre qualquer problema: gestor@suporte.com'),
        ],
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Eixos
    paint.color = Colors.grey;
    canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height), paint);
    canvas.drawLine(Offset(0, 0), Offset(0, size.height), paint);

    // Dados de amostra para o gráfico
    final blueData = [0, 50, 100, 300, 200, 600, 400, 0, 100, 50, 10, 100];
    final redData = [10, 20, 300, 50, 100, 400, 100, 0, 50, 150, 200, 10];

    // Escala do gráfico
    double xStep = size.width / (blueData.length - 1);
    double yMax = 600; // Máximo valor no eixo Y
    double yScale = size.height / yMax;

    // Desenhar linha azul
    paint.color = Colors.blue;
    for (int i = 0; i < blueData.length - 1; i++) {
      final startPoint = Offset(i * xStep, size.height - blueData[i] * yScale);
      final endPoint = Offset((i + 1) * xStep, size.height - blueData[i + 1] * yScale);
      canvas.drawLine(startPoint, endPoint, paint);
    }

    // Desenhar linha vermelha
    paint.color = Colors.red;
    for (int i = 0; i < redData.length - 1; i++) {
      final startPoint = Offset(i * xStep, size.height - redData[i] * yScale);
      final endPoint = Offset((i + 1) * xStep, size.height - redData[i + 1] * yScale);
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
