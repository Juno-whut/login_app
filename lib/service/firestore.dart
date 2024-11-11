import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {

  // get collection of notes from db
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  // Create: add new note
  Future<void> addNote(String note) {
    return notes.add(
      {'note': note,
      'timestap': Timestamp.now()}
    );
  }
 
  // Read: get notes from db
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream = notes.orderBy('timestap', descending: true).snapshots();

    return notesStream;
  }

  // Update: update notes in db given doc id
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestap': Timestamp.now()
    });
  }
  // Delete: delete notes from db given doc id
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}