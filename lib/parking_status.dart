import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkease/dashboard.dart';
import 'package:parkease/parking_details.dart';
import 'package:parkease/user_provider.dart';
import 'package:provider/provider.dart';

class ParkingStatusPage extends StatefulWidget {
  @override
  _ParkingStatusPageState createState() => _ParkingStatusPageState();
}

class _ParkingStatusPageState extends State<ParkingStatusPage> {
  DateTime _startTime = DateTime.now();
  int _selectedDuration = 1; // Default duration in hours
  final List<int> _durations = [1, 2, 3, 4, 5]; // List of available durations
  int _costPerHour = 15; // cost per hour
  String email = '';
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    // ignore: unused_local_variable
    String uid = userProvider.uid;
    // ignore: unused_local_variable
    email = userProvider.email;
    int totalCost = _selectedDuration * _costPerHour;

    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Status'),
        backgroundColor: Color.fromARGB(255, 98, 190, 236),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Starting Time: $_startTime'),
            SizedBox(height: 20),
            Text('Select Parking Duration (hours):'),
            DropdownButton<int>(
              value: _selectedDuration,
              onChanged: (newValue) {
                setState(() {
                  _selectedDuration = newValue!;
                });
              },
              items: _durations.map((duration) {
                return DropdownMenuItem<int>(
                  value: duration,
                  child: Text('$duration hours'),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('End Time: ${_calculateEndTime().toString()}'),
            SizedBox(height: 20),
            Text('Cost per Hour: \Rs. $_costPerHour'),
            SizedBox(height: 20),
            Text('Total Cost: \Rs. ${totalCost.toStringAsFixed(2)}'),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // ignore: unused_local_variable
                    ParkingDetails parking = ParkingDetails(
                      startTime: _startTime,
                      duration: _selectedDuration,
                      totalCost: totalCost,
                    );
                    // ParkingDetails parking = ParkingDetails(
                    //     startTime: _startTime, duration: _selectedDuration);

                    await FirebaseFirestore.instance
                        .collection('Books')
                        .doc(_startTime.toString())
                        .set({
                      'email': email,
                      'dateTime1': _startTime,
                      'duration': _selectedDuration,
                      'totalCost': totalCost,
                      'pID': 1,
                    });

                    // Update available slots in 'Parkings' collection
                    await updateAvailableSlots();
                    // Update b_count in 'Users' collection
                    await updateBCount();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    ); // Close the page
                  },
                  child: Text('Confirm'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 98, 190, 236),
                    //textStyle: TextStyle(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Store parking details

                    //to navigate to new page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                    // Implement confirmation logic here
                    // For example, you can store parking details and navigate to a new page.
                  },
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 98, 190, 236),
                    //textStyle: TextStyle(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Dashboard()),
            //     );
            //     // Implement confirmation logic here
            //   },
            //   child: Text('Confirm Parking'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Color.fromARGB(255, 98, 190, 236),
            //     //textStyle: TextStyle(color: Colors.black),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  DateTime _calculateEndTime() {
    return _startTime.add(Duration(hours: _selectedDuration));
  }

  Future<void> updateAvailableSlots() async {
    try {
      // Fetch current available slots
      DocumentSnapshot parkingDoc = await FirebaseFirestore.instance
          .collection('Parkings')
          .doc('1') // Document ID is '1'
          .get();

      if (parkingDoc.exists) {
        int currentAvailableSlots = parkingDoc['pAvail'];
        // Update available slots
        await FirebaseFirestore.instance
            .collection('Parkings')
            .doc('1')
            .update({'pAvail': currentAvailableSlots - 1});
      }
    } catch (e) {
      print('Error updating available slots: $e');
    }
  }

  Future<void> updateBCount() async {
    try {
      // Fetch current b_count from 'Users' collection
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(email) // Replace 'user_id' with the actual user ID or email
          .get();

      if (userDoc.exists) {
        int currentBCount = userDoc['b_count'];

        // Update b_count
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(email)
            .update({'b_count': currentBCount + 1});
      }
    } catch (e) {
      print('Error updating b_count: $e');
    }
  }
}
