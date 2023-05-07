import 'package:flutter/material.dart';
import 'package:oxygen_detector/components/bottom_navbar.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Health Screen"),
      bottomNavigationBar: BottomNavbar(initialIndex: 1),
    );
  }
}
