import 'package:flutter/material.dart';
import 'package:skillwave/screens/auntification/block/login_state_block.dart';
import 'package:skillwave/screens/onbourding/onboarding_screen.dart';
// import 'package:skillwave/screens/auntification/sign/sign.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xywozykuxyqkubprtzql.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5d296eWt1eHlxa3VicHJ0enFsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1MDY3NzUsImV4cCI6MjAyNDA4Mjc3NX0.pZHIMs4Jzm-h4dPzA8jqqiqZPKhOFKUCRoMljmKM54g',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final RegistrationStateManager registrationStateManager =
      RegistrationStateManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Onboarding(),
    );
  }
}
