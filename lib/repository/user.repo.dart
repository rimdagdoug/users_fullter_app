
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled3/model/user.model.dart';

Future addUser(User user) async{
  final docUser = FirebaseFirestore.instance.collection("users").doc();
  user.id = docUser.id;
  await docUser.set(user.toJson());
}