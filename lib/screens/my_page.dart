import 'package:flutter/material.dart';
import 'package:oxygen_detector/components/bottom_navbar.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("MyPage Screen"),
      bottomNavigationBar: BottomNavbar(initialIndex: 2),
    );
  }
}
