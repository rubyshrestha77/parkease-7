import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkease/dashboard.dart';
import 'package:parkease/user_provider.dart';
import 'package:provider/provider.dart';

// class ParkingDetails {
//   final DateTime startTime;
//   final int duration;

//   ParkingDetails({required this.startTime, required this.duration});
// }
class ParkingDetails {
  final DateTime startTime;
  final int duration;
  final int totalCost; // Add totalCost field

  ParkingDetails({
    required this.startTime,
    required this.duration,
    required this.totalCost,
  });
}

class BookData {
  final String dateTime1;
  final int duration;
  final double totalCost;

  BookData(
      {required this.dateTime1,
      required this.duration,
      required this.totalCost});
}

class ParkingDetailsScreen extends StatefulWidget {
  @override
  State<ParkingDetailsScreen> createState() => _ParkingDetailsScreenState();
}

class _ParkingDetailsScreenState extends State<ParkingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    // ignore: unused_local_variable
    String uid = userProvider.uid;
    // ignore: unused_local_variable
    final String useremail = userProvider.email;
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Details'),
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
      body: ParkingDetailsTable(),
    );
  }
}

class ParkingDetailsTable extends StatelessWidget {
  final List<ParkingDetails> parkingData = [
    ParkingDetails(
        startTime: DateTime(2024, 2, 27, 10, 0), duration: 2, totalCost: 30),
    ParkingDetails(
        startTime: DateTime(2024, 2, 27, 13, 30), duration: 1, totalCost: 15),
    ParkingDetails(
        startTime: DateTime(2024, 2, 27, 16, 45), duration: 3, totalCost: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Start Time')),
        DataColumn(label: Text('Duration (hours)')),
        DataColumn(label: Text('Total Cost')),
      ],
      rows: parkingData.map((parking) {
        return DataRow(cells: [
          DataCell(
              Text('${parking.startTime.hour}:${parking.startTime.minute}')),
          DataCell(Text('${parking.duration}')),
          DataCell(Text('\Rs. ${parking.totalCost.toStringAsFixed(2)}')),
        ]);
      }).toList(),
    );
  }
  // }
}
