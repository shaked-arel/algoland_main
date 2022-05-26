import 'package:binarysearch/Algorithms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'global.dart';

class AuthGate extends StatelessWidget {
  AuthGate({Key? key}) : super(key: key);

  final databaseRef = FirebaseDatabase.instance.ref("progress/user");

  Future<int> getPer1() async {
    try {
      final snapshot = await databaseRef
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("bubble")
          .get();
      print(snapshot.value);
      int num = int.parse(snapshot.value.toString());
      assert(num is int);
      return num;
    } catch (err) {
      rethrow;
    }
  }

  Future<int> getPer2() async {
    try {
      final snapshot = await databaseRef
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("insertion")
          .get();
      print(snapshot.value);
      int num = int.parse(snapshot.value.toString());
      assert(num is int);
      return num;
    } catch (err) {
      rethrow;
    }
  }

  Future<int> getPer3() async {
    try {
      final snapshot = await databaseRef
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("binary")
          .get();
      print(snapshot.value);
      int num = int.parse(snapshot.value.toString());
      assert(num is int);
      return num;
    } catch (err) {
      rethrow;
    }
  }

  void get() async {
    precentBubble = await getPer1();
    precentInsertion = await getPer2();
    precentBinary = await getPer3();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      // If the user is already signed-in, use it as initial data
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
          );
        } else {
          get();
        }

        // Render your application if authenticated

        return Algorithms();
      },
    );
  }
}
