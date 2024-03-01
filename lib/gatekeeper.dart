import 'package:flutter/material.dart';
import 'package:parkease/dashboard.dart';

class Gatekeeper extends StatefulWidget {
  @override
  State<Gatekeeper> createState() => _GatekeeperState();
}

class _GatekeeperState extends State<Gatekeeper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vehicle Booking Table'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Vehicle Number')),
                DataColumn(label: Text('Booking Time')),
                DataColumn(label: Text('Exit Time')),
                DataColumn(label: Text('Arrived')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('ABC123')),
                  DataCell(Text(
                      '2024-02-27 10:00 AM')), // Replace with actual booking time
                  DataCell(Text(
                      '2024-02-27 03:00 PM')), // Replace with actual exit time
                  DataCell(ArrivedButton()), // Custom DataCell with buttons
                ]),
                DataRow(cells: [
                  DataCell(Text('XYZ456')),
                  DataCell(Text(
                      '2024-02-27 11:00 AM')), // Replace with actual booking time
                  DataCell(Text(
                      '2024-02-27 04:00 PM')), // Replace with actual exit time
                  DataCell(ArrivedButton()), // Custom DataCell with buttons
                ]),
                // Add more rows as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ArrivedButton extends StatefulWidget {
  @override
  _ArrivedButtonState createState() => _ArrivedButtonState();
}

class _ArrivedButtonState extends State<ArrivedButton> {
  bool arrived = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(arrived ? Icons.check_circle : Icons.cancel),
      color: arrived ? Colors.green : Colors.red,
      onPressed: () {
        setState(() {
          arrived = !arrived;
        });
      },
    );
  }
}
