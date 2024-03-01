//for displaying all data
//adim lai
// scrollable

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTableWidget extends StatefulWidget {
  @override
  State<FirebaseTableWidget> createState() => _FirebaseTableWidgetState();
}

class _FirebaseTableWidgetState extends State<FirebaseTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('Users').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Address')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Number')),
                DataColumn(label: Text('Username')),
                DataColumn(label: Text('Vehicle No.')),
                DataColumn(label: Text('Edit')),
                // Add more DataColumn widgets for additional columns
              ],
              rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;

                return DataRow(
                  cells: [
                    DataCell(Text(data['address'].toString())),
                    DataCell(Text(data['email'].toString())),
                    DataCell(Text(data['number'].toString())),
                    DataCell(Text(data['username'].toString())),
                    DataCell(Text(data['vehicleNumber'].toString())),
                    DataCell(IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ))
                    // Add more DataCell widgets for additional columns
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
