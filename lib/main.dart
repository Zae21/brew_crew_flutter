import 'package:brew_crew/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Brew Crew',
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              print(snapshot.hasError);
              return Container();
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return Wrapper();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            // return Loading();
            return Container();
          },
        ));
  }
}
