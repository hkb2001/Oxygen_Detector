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
    Color getColor(double value) {
      if (value < 60) {
        return Colors.red;
      } else if (value < 90) {
        return Colors.orange;
      } else {
        return Colors.green;
      }
    }

    String getProgressText(double value) {
      if (value < 60) {
        return "Low";
      } else if (value < 90) {
        return "Medium";
      } else {
        return "High";
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Health",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Oxygen Saturation",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: _spo2 / 100,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(getColor(_spo2)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SPO2: ${_spo2.toStringAsFixed(2)}%",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        getProgressText(_spo2),
                        style: TextStyle(
                          color: getColor(_spo2),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Heart Rate",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: _bpm / 200,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(getColor(_bpm)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BPM: ${_bpm.toStringAsFixed(0)}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavbar(
          initialIndex: 0,
        ),
      ),
    );
  }
}
