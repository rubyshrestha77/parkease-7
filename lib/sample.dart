import 'package:flutter/material.dart';
import 'SPParking.dart';
import 'SBParking.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Areas'),
        backgroundColor: Color.fromARGB(255, 98, 190, 236),
      ),
      body: Container(
        color: Color.fromARGB(255, 230, 225, 225),
        child: Center(
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                buildParkingItem(
                    context, 'Sitapaila Parking', Icons.location_on, () {
                  print('Sitapaila Parking Selected');
                }),
                buildParkingItem(
                    context, 'Swayambhu Parking', Icons.location_on, () {
                  print('Swayambhu Parking Selected');
                }),
                // Add more parking items as needed
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildParkingItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: () {
        if (title == 'Sitapaila Parking') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SPParking()),
          );
        } else if (title == 'Swayambhu Parking') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SBParking()),
          );
        } else {
          onTap();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 98, 190, 236),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 230, 225, 225),
              spreadRadius: 1,
              blurRadius: 6,
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
