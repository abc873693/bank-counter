import 'dart:async';
import 'dart:math';

import 'package:bank_counter/models/bank_counter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const WORK_MAX_TIME = 1500;
  static const WORK_MIN_TIME = 500;

  final random = Random();

  final bankCounters = [
    BankCounter(name: 'Amy'),
    BankCounter(name: 'Bob'),
    BankCounter(name: 'Cory'),
    BankCounter(name: 'Dora'),
  ];

  int count = 1;

  List<String> waitingClients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Counter'),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 16.0,
        ),
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Waitings: ${waitingClients.length}'),
            ElevatedButton(
              onPressed: _checkIdleBankCounter,
              child: Text('Next $count'),
              // icon: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              const DataColumn(
                label: Text('Counter'),
              ),
              const DataColumn(
                label: Text('Processing'),
              ),
              const DataColumn(
                label: Text('Processed'),
              ),
            ],
            rows: List<DataRow>.generate(
              bankCounters.length,
              // Loops through dataColumnText, each iteration assigning the value to element
              (index) => DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(bankCounters[index].name),
                  ),
                  //Extracting from Map tableRefuge[index] the value
                  DataCell(
                    Text(bankCounters[index].processingClient.text),
                  ),
                  DataCell(
                    Text(bankCounters[index].processedClients.text),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkIdleBankCounter() {
    final client = '${count++}';
    for (var bankCounter in bankCounters) {
      if (bankCounter.processingClient.isIdle) {
        setState(() => bankCounter.processingClient = client);
        _work(bankCounter);
        return;
      }
    }
    setState(() => waitingClients.add(client));
  }

  void _work(BankCounter bankCounter) async {
    final workMilliseconds =
        random.nextInt(WORK_MAX_TIME - WORK_MIN_TIME) + WORK_MIN_TIME;
    print(
        '${bankCounter.name} will work in ${workMilliseconds / 1000.0} seconds');
    Future.delayed(
      Duration(milliseconds: workMilliseconds),
      () {
        bankCounter.finishWork();
        if (waitingClients.length != 0) {
          String newClient = waitingClients.removeAt(0);
          bankCounter.processingClient = newClient;
          _work(bankCounter);
        }
        setState(() {});
      },
    );
  }
}
