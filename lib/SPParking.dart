import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'SPBook.dart';

class SPParking extends StatefulWidget {
  @override
  State<SPParking> createState() => _SPParkingState();
}

class _SPParkingState extends State<SPParking> {
  late double lat = 27.7081977;
  late double long = 85.2818160;

  Future<void> getLatLong() async {
    try {
      Position position = await _determinePosition();
      setState(() {
        lat = position.latitude;
        long = position.longitude;
      });
    } catch (error) {
      print("Error: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    getLatLong();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sitapaila Parking Details'),
        backgroundColor: Color.fromARGB(255, 98, 190, 236),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Total Slots Button
          _buildTotalSlotsButton(),
          SizedBox(height: 8), // Reduced gap here
          // Available Slots Button
          _buildAvailableSlotsButton(context),
          SizedBox(height: 16), // Maintaining other gaps
          // Map Screenshot
          Expanded(
            // child: Placeholder(
            // Replace Placeholder with ss widget of map
            // fallbackHeight: 200,
            //   ),
            child: GoogleMapsWidget(
              apiKey: "AIzaSyCS2SpkuFJ2gvvUIjaCVbAvvKXoB9ITWpo",
              // sourceLatLng: LatLng(27.7182645, 85.2842333),
              sourceLatLng: LatLng(lat, long),
              destinationLatLng: LatLng(27.7081977, 85.2818160), //sitapaila
              // destinationLatLng: LatLng(27.7143721, 85.2936412), //swoyambhu
            ),
            // Image.asset('images/sitapaila.png'),
          ),
          SizedBox(height: 50),
          // Book and Cancel Buttons
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildTotalSlotsButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {}, // Make it unclickable
        child: Card(
          //elevation: 3,
          color: Color.fromARGB(255, 98, 190, 236),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Total Slots",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "15",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableSlotsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SPBook()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 98, 190, 236),
          //textStyle: TextStyle(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Available Slots",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    //take context as a parameter
    return Padding(
      // padding: const EdgeInsets.all(16.0),
      // padding: EdgeInsets.zero,
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              //book ko function implement
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SPBook()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 98, 190, 236),
              // textStyle: TextStyle(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadowColor: Colors.transparent,
            ),
            child: Text(
              'Book',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              //cancel ko functionality implement
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 98, 190, 236),
              //textStyle: TextStyle(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadowColor: Colors.transparent,
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
