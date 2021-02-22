import 'package:cloud_firestore/cloud_firestore.dart';

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
}
