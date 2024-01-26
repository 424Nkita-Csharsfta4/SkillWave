import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skillwave/bloc/onbourding_bloc.dart';
import 'package:skillwave/course/screens/dashboard_screen.dart';
import 'package:skillwave/screens/auntification/login/login.dart';
import 'package:skillwave/screens/auntification/sign/sign.dart';
import 'package:skillwave/screens/onbourding/onboarding_screen.dart';
import 'package:skillwave/screens/profile/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC-AcRDGJ775rr7MaOiL2IgwtSZ0vh7_jA',
      projectId: 'auntefication-98ff3',
      appId: '1:211196806595:android:750c99a1e160a6965ca976',
      messagingSenderId: '',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
