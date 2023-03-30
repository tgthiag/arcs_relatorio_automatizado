import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:excel_to_json/excel_to_json.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _importFromExcel() async {
    String? excel = await ExcelToJson().convert();
    var jsonfile = json.decode(excel!);
    var rest = jsonfile["Banco de dados"];

    final filteredData = rest.where((item) =>
        item["Conclusão"] == "PROCEDENTE" &&
        item["Ano"] > 2020 &&
        item["Área responsável"] == "CONVERSÃO");

    filteredData.forEach((item) {
      print(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        child: Table(
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(2),
              4: FlexColumnWidth(2),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(
                width: 1.0,
                color: Colors.grey,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            children: [
              TableRow(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  children: [
                    Text('Setores',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Ultima reclamação:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Recorde anterior\n sem reclamações:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Arc's procedentes\nno mês ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Arc's procedentes\nno ano ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Flap Disk',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text('Dart', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Folhas',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text('Java', textAlign: TextAlign.center),
                Text('James Gosling', textAlign: TextAlign.center),
                Text('James Gosling', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Cinta Larga',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text('sdasdas', textAlign: TextAlign.center),
                Text('Jamsadasdes Gosling', textAlign: TextAlign.center),
                Text('Jamsadasdes Gosling', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Cinta Estreita',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text('Dart', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Rolos',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text('Java', textAlign: TextAlign.center),
                Text('James Gosling', textAlign: TextAlign.center),
                Text('James Gosling', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Pluma',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text('sdasdas', textAlign: TextAlign.center),
                Text('Jamsadasdes Gosling', textAlign: TextAlign.center),
                Text('Jamsadasdes Gosling', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Fibra',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text('sdasdas', textAlign: TextAlign.center),
                Text('Jamsadasdes Gosling', textAlign: TextAlign.center),
                Text('Jamsadasdes Gosling', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('SpeedLock',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text('sdasdas', textAlign: TextAlign.center),
                Text('Jamsadasdes Gosling', textAlign: TextAlign.center),
                Text('Jamsadasdes Gosling', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
              ]),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _importFromExcel,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
