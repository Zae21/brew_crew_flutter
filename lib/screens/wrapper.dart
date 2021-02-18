import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Ouser>(context);
    print(user);
    return Auth();
  }
}
