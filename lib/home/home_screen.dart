import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../components/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DatabaseReference _spo2Ref;
  late DatabaseReference _bpmRef;

  double _spo2 = 0.0;
  double _bpm = 0.0;

  @override
  void initState() {
    super.initState();

    // Initialize Firebase

    // Get references to the SPO2 and BPM values in the database
    _spo2Ref = FirebaseDatabase.instance.ref().child('SpO2');
    _bpmRef = FirebaseDatabase.instance.ref().child('bpm');

    // Listen for changes to the values in the database
    _spo2Ref.onValue.listen((event) {
      setState(() {
        _spo2 = double.parse('${event.snapshot.value ?? 0.0}');
      });
    });
    _bpmRef.onValue.listen((event) {
      setState(() {
        _bpm = double.parse('${event.snapshot.value ?? 0.0}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                "Health",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              "Oxygen Saturation",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "SPO2: $_spo2",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "BPM: $_bpm",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavbar(initialIndex: 0),
      ),
    );
  }
}
