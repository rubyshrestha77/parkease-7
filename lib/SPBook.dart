import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkease/parking_status.dart';

class SPBook extends StatefulWidget {
  @override
  _SBBookState createState() => _SBBookState();
}

class _SBBookState extends State<SPBook> {
  int totalSlots = 15; // Total number of slots
  int availableSlots = 15; // Initially, all slots are available
  int columns = 3; // Number of columns
  double slotSize = 60.0; // Size of each slot box
  double outerBoxMargin = 5.0; // Margin for the outer box

  List<bool> isSlotBooked =
      List.generate(15, (index) => false); // Track booked slots

  // @override
  @override
  void initState() {
    super.initState();
    // Fetch availableSlots value from Firebase on widget initialization
    fetchAvailableSlots();
  }

  // Function to fetch availableSlots from Firebase
  Future<void> fetchAvailableSlots() async {
    try {
      DocumentSnapshot parkingDoc = await FirebaseFirestore.instance
          .collection('Parkings')
          .doc('1') // Document ID is '1'
          .get();

      if (parkingDoc.exists) {
        // If the document exists, update availableSlots value
        setState(() {
          availableSlots = parkingDoc['pAvail'];
        });
      }
    } catch (e) {
      print('Error fetching availableSlots: $e');
    }
  }

  Widget build(BuildContext context) {
    // Calculate the number of slots per row
    int slotsPerRow = (totalSlots / columns).ceil();

    List<Widget> slots = [];
    for (int i = 0; i < totalSlots; i++) {
      // Generate slots
      slots.add(Column(
        children: [
          GestureDetector(
            onTap: () {
              // Check if slot is available
              if (!isSlotBooked[i]) {
                // Reduce available slots after booking
                setState(() {
                  isSlotBooked[i] = true;
                  availableSlots--;
                });
                // Show booking confirmation dialog
                _showBookingConfirmation(context);
              }
            },
            child: Container(
              width: slotSize,
              height: slotSize,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: isSlotBooked[i]
                    ? Colors.red.shade200
                    : Color.fromARGB(255, 98, 190, 236),
                // Change color if slot is booked or not available
                borderRadius: BorderRadius.circular(8), // Make corners circular
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 98, 190, 236),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  isSlotBooked[i] ? 'Booked' : '',
                  // Show "Booked" text if slot is booked
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 190, 236),
        title: Text(
          'Sitapaila Parking Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          // Set text color of the title
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 98, 190, 236),
        // Background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Box to display total and available slots
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0), // Reduced vertical padding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Slots: $totalSlots',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 20), // Add space between text
                    Text(
                      'Available Slots: $availableSlots',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // Outer box with border radius
              Container(
                margin: EdgeInsets.all(outerBoxMargin),
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0), // Reduced vertical padding,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                    // Border radius
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  // Padding for the inner content
                  child: Column(
                    children: [
                      // Slot area
                      for (int i = 0; i < slotsPerRow; i++)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int j = 0;
                                    j < columns && i * columns + j < totalSlots;
                                    j++)
                                  Column(
                                    children: [
                                      slots[i * columns + j],
                                      SizedBox(
                                        height: 10,
                                      ), // Add space between slots
                                    ],
                                  ),
                                SizedBox(
                                  width: 10,
                                ), // Add space between columns of slots
                              ],
                            ),
                          ],
                        ),
                      SizedBox(height: 20),
                      // Add space between slots and buttons
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     ElevatedButton(
                      //       onPressed: () {
                      //         Navigator.pushNamed(context, 'sample');
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor:
                      //             Color.fromARGB(255, 98, 190, 236),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(6),
                      //         ),
                      //         shadowColor: Colors.transparent,
                      //       ),
                      //       child: Text(
                      //         'Cancel',
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(width: 10),
                      //     // Add space between buttons
                      //     ElevatedButton(
                      //       onPressed: () {
                      //         Navigator.pushNamed(context, 'sample');
                      //         // Add functionality for payment button
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor:
                      //             Color.fromARGB(255, 98, 190, 236),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(6),
                      //         ),
                      //         shadowColor: Colors.transparent,
                      //       ),
                      //       child: Text(
                      //         'Payment',
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show booking confirmation dialog
  Future<void> _showBookingConfirmation(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Booking Confirmation',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your booking will be confirm soon.'),
                SizedBox(height: 10),
                // Text(
                // 'If you do not reach the spot within 15 minutes of booking, the booked spot shall be released.'),
                Text('please be on time'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ParkingStatusPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
