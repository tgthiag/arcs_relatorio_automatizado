import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  late final filteredList;
  ResultsScreen(this.filteredList);
  // late final flapData = FilteredList.where((item) =>
  // item["ORIGEM DA ARC"] == "FLAP DISC"
  // );
  getdaysSince(setor){
    DateTime? mostRecentDate;
    for (var item in filteredList[setor]) {
      String? dateString = item["Abertura\ndo ARC"];
      if (dateString == null) continue;
      DateTime date = DateTime.parse(dateString);
      if (mostRecentDate == null || date.isAfter(mostRecentDate)) {
        mostRecentDate = date;
      }
    }
    Duration daysSince = DateTime.now().difference(mostRecentDate!);
    return '${daysSince.inDays} dias';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Relatório de ARC's"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        child: Table(
            columnWidths: const {
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
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
                  children: [
                    const Text('Setores',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Ultima reclamação \nProcedente",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Recorde anterior\n sem reclamações:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text("Arc's procedentes\nno mês ",
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
                Text(getdaysSince('FLAP DISC'), textAlign: TextAlign.center),
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
                Text(getdaysSince('FOLHAS'), textAlign: TextAlign.center),
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
                Text(getdaysSince('CINTA LARGA'), textAlign: TextAlign.center),
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
                Text(getdaysSince('CINTA ESTREITA'), textAlign: TextAlign.center),
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
                Text(getdaysSince('CORTADEIRA DE ROLOS '), textAlign: TextAlign.center),
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
                Text(getdaysSince('VELCRO'), textAlign: TextAlign.center),
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
                Text(getdaysSince('FIBRAS'), textAlign: TextAlign.center),
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
                Text(getdaysSince('SPEED LOCK'), textAlign: TextAlign.center),
                Text('Jamsadasdes Gosling', textAlign: TextAlign.center),
                Text('Jamsadasdes Gosling', textAlign: TextAlign.center),
                Text('Lars Bak', textAlign: TextAlign.center),
              ]),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(getdaysSince('FLAP DISC')),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}