import 'package:flutter/material.dart';
import 'package:skillwave/bloc/onbourding_bloc.dart';
import 'package:skillwave/course/screens/dashboard_screen.dart';
import 'package:skillwave/screens/onbourding/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 248, 244, 255)),
          useMaterial3: true,
          fontFamily: 'Gilroy',
          textTheme: Theme.of(context).textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                titleSmall: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 1.8,
                ),
              ),
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
