import 'package:flutter/material.dart';
import 'package:parkease/dashboard.dart';

class Sample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        // primarySwatch: Colors.,
        scaffoldBackgroundColor: Color.fromARGB(255, 243, 238, 238),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 98, 190, 236),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            textStyle: TextStyle(fontSize: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      home: ParkingDashboard(),
    );
  }
}

class ParkingDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Parking Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ParkingDetailsPage(
                      'Sitapaila',
                      totalSlots: 150,
                      availableSlots: 50,
                      chargePerHour: 10.0,
                    ),
                  ),
                );
              },
              child: Text('NOT Sitapaila Parking'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ParkingDetailsPage(
                      'Swayambhu',
                      totalSlots: 110,
                      availableSlots: 30,
                      chargePerHour: 10.0,
                    ),
                  ),
                );
              },
              child: Text('NOT Swayambhu Parking'),
            ),
          ],
        ),
      ),
    );
  }
}

class ParkingDetailsPage extends StatelessWidget {
  final String parkingType;
  final int totalSlots;
  final int availableSlots;
  final double chargePerHour;

  ParkingDetailsPage(
    this.parkingType, {
    required this.totalSlots,
    required this.availableSlots,
    required this.chargePerHour,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$parkingType Parking Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Slots: $totalSlots',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
              ),
            ),
            Text(
              'Available Slots: $availableSlots',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(chargePerHour),
                  ),
                );
              },
              child: Text('Book Parking'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  final double chargePerHour;

  BookingPage(this.chargePerHour);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Charge Per Hour: Rs.${chargePerHour.toStringAsFixed(2)}',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your booking confirmation logic here
                // This is a placeholder for the booking confirmation action
                print('Booking Confirmed');
              },
              child: Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
