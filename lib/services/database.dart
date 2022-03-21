import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getResources() async {
    return FirebaseFirestore.instance.collection("resources").snapshots();
  }

  Future<void> addMessage(uid, chatMessageData) async {
    FirebaseFirestore.instance
        .collection("questions")
        .doc(uid)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addUserInfo(userData, uid) async {
    await FirebaseFirestore.instance
        .collection("qr")
        .doc(uid)
        .set(userData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addWithdrawalRequest(userData, uid) async {
    await FirebaseFirestore.instance
        .collection("withdrawal")
        .doc(uid)
        .set(userData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> updateUserInfo(value, uid, field) async {
    await FirebaseFirestore.instance
        .collection('qr')
        .doc(uid)
        .update({field: value}).catchError((e) {
      print(e.toString());
    });
  }

  getChats(uid) async {
    return FirebaseFirestore.instance
        .collection("questions")
        .doc(uid)
        .collection("chats")
        .orderBy('dateSent', descending: false)
        .snapshots();
  }

  getUserInfo(String uid) async {
    return FirebaseFirestore.instance
        .collection("qr")
        .doc(uid)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }
}
