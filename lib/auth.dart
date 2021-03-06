import 'package:binarysearch/Algorithms.dart';
import 'package:binarysearch/wait.dart';
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

  Future<List<int>> getLev1() async {
    try {
      final snapshot = await databaseRef
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("levelsBubble")
          .get();
      print(snapshot.value);
      List<int> lev = [];
      snapshot.children.forEach((child) {
        int num = int.parse(child.value.toString());
        assert(num is int);
        lev.add(num);
      });
      return lev;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<int>> getLev2() async {
    try {
      final snapshot = await databaseRef
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("levelsInsertion")
          .get();
      print(snapshot.value);
      List<int> lev = [];
      snapshot.children.forEach((child) {
        int num = int.parse(child.value.toString());
        assert(num is int);
        lev.add(num);
      });
      return lev;
    } catch (err) {
      rethrow;
    }
  }

  Future<List<int>> getLev3() async {
    try {
      final snapshot = await databaseRef
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("levelsBinary")
          .get();
      print(snapshot.value);
      List<int> lev = [];
      snapshot.children.forEach((child) {
        int num = int.parse(child.value.toString());
        assert(num is int);
        lev.add(num);
      });
      return lev;
    } catch (err) {
      rethrow;
    }
  }

  void get() async {
    precentBubble = await getPer1();
    precentInsertion = await getPer2();
    precentBinary = await getPer3();
    levelsBubble = await getLev1();
    levelsInsertion = await getLev2();
    levelsBinary = await getLev3();
  }

  void set() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    final uid = user.uid;
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference myRef = FirebaseDatabase.instance.ref("progress/user");
    var ref = myRef.child(uid);
    ref.update({
      "bubble": 0,
      "binary": 0,
      "insertion": 0,
      "levelsBubble": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      "levelsBinary": [0, 0, 0, 0, 0, 0, 0],
      "levelsInsertion": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    });
  }

  @override
  Widget build(BuildContext context) {
    bool firstUse = false;
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      // If the user is already signed-in, use it as initial data
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          firstUse = true;
          return SignInScreen(
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
          );
        } else {
          get();
        }
        if (firstUse) {
          set();
        }
        // Render your application if authenticated
        return Algorithms();
      },
    );
  }
}
