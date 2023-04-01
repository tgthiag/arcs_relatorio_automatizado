import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final filteredList;

  const ResultsScreen(this.filteredList);

  getdaysSince(setor) {
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

  String getBiggestDaysDifference(setor) {
    int maxDifference = 0;
    DateTime? previousDate;

    var filteredData = filteredList[setor];
    filteredData.sort((a, b) => DateTime.parse(a["Abertura\ndo ARC"])
        .compareTo(DateTime.parse(b["Abertura\ndo ARC"])));

    for (var item in filteredData) {
      String dateString = item["Abertura\ndo ARC"];
      DateTime date = DateTime.parse(dateString);

      if (previousDate != null) {
        Duration difference = date.difference(previousDate);
        int daysDifference = difference.inDays;

        if (daysDifference > maxDifference) {
          maxDifference = daysDifference;
        }
      }

      previousDate = date;
    }

    return '$maxDifference dias';
  }

  arcsThisMonthYear(setor, period) {
    var now = DateTime.now();
    if (period == "m") {
      var filteredDataMonth = filteredList[setor].where((item) =>
          DateTime.parse(item["Abertura\ndo ARC"]).year == now.year &&
          DateTime.parse(item["Abertura\ndo ARC"]).month == now.month);
      return filteredDataMonth.length.toString();
    } else if (period == "y") {
      var filteredDataYear = filteredList[setor].where(
          (item) => DateTime.parse(item["Abertura\ndo ARC"]).year == now.year);
      return filteredDataYear.length.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Relatório de ARC's", style: TextStyle(fontFamily: "Tomorrow", fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
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
                color: Colors.blueGrey,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            children: [
              TableRow(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  children: [
                    Text('Setores',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Ultima reclamação \nProcedente",
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
                const Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Flap Disk',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text(getdaysSince('FLAP DISC'), textAlign: TextAlign.center),
                Text(getBiggestDaysDifference("FLAP DISC"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear('FLAP DISC', "m"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear('FLAP DISC', "y"),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                const Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Folhas',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text(getdaysSince('FOLHAS'), textAlign: TextAlign.center),
                Text(getBiggestDaysDifference("FOLHAS"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("FOLHAS", "m"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("FOLHAS", "y"),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                const Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Cinta Larga',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text(getdaysSince('CINTA LARGA'), textAlign: TextAlign.center),
                Text(getBiggestDaysDifference("CINTA LARGA"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("CINTA LARGA", "m"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("CINTA LARGA", "y"),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                const Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Cinta Estreita',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text(getdaysSince('CINTA ESTREITA'),
                    textAlign: TextAlign.center),
                Text(getBiggestDaysDifference("CINTA ESTREITA"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("CINTA ESTREITA", "m"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("CINTA ESTREITA", "y"),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                const Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Rolos',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text(getdaysSince('CORTADEIRA DE ROLOS '),
                    textAlign: TextAlign.center),
                Text(getBiggestDaysDifference('CORTADEIRA DE ROLOS '),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("CORTADEIRA DE ROLOS ", "m"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("CORTADEIRA DE ROLOS ", "y"),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                const Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Pluma',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text(getdaysSince('VELCRO'), textAlign: TextAlign.center),
                Text(getBiggestDaysDifference('VELCRO'),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("VELCRO", "m"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("VELCRO", "y"),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                const Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('Fibra',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text(getdaysSince('FIBRAS'), textAlign: TextAlign.center),
                Text(getBiggestDaysDifference('FIBRAS'),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("FIBRAS", "m"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear("FIBRAS", "y"),
                    textAlign: TextAlign.center),
              ]),
              TableRow(children: [
                const Padding(
                    padding: EdgeInsets.all(4),
                    //apply padding to all four sides
                    child: Text('SpeedLock',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text(getdaysSince('SPEED LOCK'), textAlign: TextAlign.center),
                Text(getBiggestDaysDifference('SPEED LOCK'),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear('SPEED LOCK', "m"),
                    textAlign: TextAlign.center),
                Text(arcsThisMonthYear('SPEED LOCK', "y"),
                    textAlign: TextAlign.center),
              ]),
            ]),
      ),
    );
  }
}
