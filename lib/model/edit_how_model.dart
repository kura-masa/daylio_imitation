import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../domain/how.dart';

class EditHowModel extends ChangeNotifier {
  // final How how;
  String? index;
  EditHowModel({this.index});

  // EditHowModel(this.how) {
  //   // titleController.text = book.title;
  //   // authorController.text = book.author;
  // }
//
  // Future update() async {
  //   await FirebaseFirestore.instance.collection('how').doc(name).update({
  //     'name': 'わけわかめ',
  //   });
  // }
}
