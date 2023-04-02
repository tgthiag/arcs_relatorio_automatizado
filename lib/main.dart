import 'dart:convert';
import 'package:arcs_relatorio_automatizado/ResultsScreeen.dart';
import 'package:flutter/material.dart';
import 'package:excel_to_json/excel_to_json.dart';
import 'dart:collection';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(500, 600);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
            item['Ano'] >= 2020 &&
            item["Área responsável"] == "CONVERSÃO" && item["ORIGEM DA ARC"] != null);

    Map<String, List<dynamic>>? groupedData = HashMap();
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
            margin: const EdgeInsets.all(20),
            child: const Text("Selecione o arquivo DADOS ARC-CUMBICA.xlsx")));
  }

  novaTela(filteredList) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultsScreen(filteredList)),
    );
  }
}
