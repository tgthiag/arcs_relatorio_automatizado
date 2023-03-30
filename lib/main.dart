import 'dart:convert';
import 'package:arcs_relatorio_automatizado/ResultsScreeen.dart';
import 'package:flutter/material.dart';
import 'package:excel_to_json/excel_to_json.dart';
import 'dart:collection';

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

    Map<String, List<dynamic>> groupedData = HashMap();
    filteredData.forEach((item) {
      String key = item["ORIGEM DA ARC"];
      if (!groupedData.containsKey(key)) {
        groupedData[key] = [item];
      } else {
        groupedData[key]!.add(item);
      }
    });

    novaTela(groupedData);
  }
  @override
  void initState() {
    super.initState();
    _importFromExcel();
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
        child: Text("olá")
    )
    );
  }
  novaTela(filteredList) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultsScreen(filteredList)),
    );
  }
}
