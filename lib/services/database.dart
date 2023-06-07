import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daylio_imitation/model/edit_how_model.dart';
import 'package:daylio_imitation/model/user.dart';

// 作成した「データの参照」から、snapshotを取得する
// Firestoreからデータを取得する方法は、get()とsnapshot()
// getは、Cloud Firestoreでリクエスト一度に一回の取得。
// snapshotは、初期スナップショットとその後のドキュの変更部分のみ取得
//  = snapshotがCloudFirestoreでリアルタイムアプデを取得。
// getがFuture。snapshotがStream。

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  // ↑DBへ複数のデータへの参照をする。
  final CollectionReference howCollection =
      FirebaseFirestore.instance.collection('how');

  //データをセット
  Future updateUserData(int index, String text, String text0ption) async {
    return await howCollection.doc(uid).set({
      'index': index,
      'text': '',
      'textOption': '',
    });
  }

  // brew list from snapshot
  // Queryも複数のデータの参照をする
  List<EditHowModel> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return EditHowModel(index: doc.get('index') ?? '');
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      index: snapshot['index'],
      text: snapshot['text'],
      textOption: snapshot['textOption'],
    );
  }

  // get brew streams
  Stream<List<EditHowModel>> get brews {
    return howCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return howCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
