import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/brew.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference brewsCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugar, String name, int strength) async {
    return await brewsCollection
        .doc(uid)
        .set({'sugar': sugar, 'name': name, 'strength': strength});
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc['name'] ?? '',
        strength: doc['strength'] ?? 0,
        sugar: doc['sugar'] ?? '0',
      );
    });
  }

  Stream<List<Brew>> get brews {
    return brewsCollection.snapshots().map(_brewListFromSnapshot);
  }
}
