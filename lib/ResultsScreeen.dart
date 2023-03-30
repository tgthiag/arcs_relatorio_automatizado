import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  late final FilteredList;
  ResultsScreen(this.FilteredList);
  late final flapData = FilteredList.where((item) =>
  item["ORIGEM DA ARC"] == "FLAP DISC"
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("widget.title"),
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
                    Text(flapData.toString(),
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
        onPressed: () => print("sdasd"),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}