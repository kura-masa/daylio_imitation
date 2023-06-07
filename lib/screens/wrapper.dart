// ignore_for_file: avoid_print

import 'package:daylio_imitation/model/user.dart';
import 'package:daylio_imitation/screens/authenticate/authenticate.dart';
import 'package:daylio_imitation/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    print(user);

    //return either Home or Authenticate widget
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
