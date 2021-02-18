import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Ouser _userFromFirebaseUser(User user) {
    return user != null ? Ouser(uid: user.uid) : null;
  }

  Stream<Ouser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // signin anonyimous
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign with email and password

  // register with email and password

  // sign out
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
