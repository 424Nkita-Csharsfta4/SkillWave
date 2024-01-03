import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skillwave/screens/profile/update_profile/update_profile.dart';

class ProfileScreen extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: user != null ? users.doc(user!.uid).snapshots() : null,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Что-то пошло не так!!!');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(data['photoUrl']),
                ),
                const SizedBox(height: 16),
                Text(data['displayName'],
                    style: Theme.of(context).textTheme.titleLarge),
                Text(data['email'],
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  child: const Text('Редактировать профиль'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
