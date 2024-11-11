import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../service/get_user.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser;

  // doucument IDS
  List<String> docIDs = [];

  // get docs
  Future getDocID() async {
    await FirebaseFirestore.instance.collection('users').get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        docIDs.add(doc.id);
    }
  });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed in as: ${user!.email!}'),
            MaterialButton(onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.deepPurple[200],
            child: const Text("Sign Out"),
            ),
            Expanded(
              child: FutureBuilder(
                future: getDocID(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GetUser(documentId: docIDs[index]),
                      );
                    },
                  );
                } 
              ),
            ),
          ],
        ),
      ),
    );
  }
}