import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oxygen_detector/home/home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAJ9cbpLJJLHmgGww6VFkROZpMTRtWEfnA",
            appId: "com.example.oxygen_detector",
            messagingSenderId: "891385107664",
            projectId: "heart-step-ok"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health',
      theme: ThemeData(
        // ignore: deprecated_member_use
        backgroundColor: Colors.redAccent,
      ),
      home: const HomeScreen(),
    );
  }
}
