import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUser extends StatelessWidget {
  final String documentId;

  const GetUser({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get collection reference
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text('Name: ${data['firstName']} ${data['lastName']}');
        } else {
        return const Text('loading...');
      }
    });
  }
}