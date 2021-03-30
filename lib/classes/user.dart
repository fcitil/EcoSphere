import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String profiletype;
  final String id;
  final String username;
  final String email;
  final String photoUrl;
  final String displayName;
  final String bio;

  User({
    this.profiletype,
    this.id,
    this.username,
    this.email,
    this.photoUrl,
    this.displayName,
    this.bio,
});

  factory User.fromDocument(DocumentSnapshot doc){
    return User(

      id: doc["id"],
      email: doc["email"],
      username: doc["username"],
      photoUrl: doc["photoUrl"],
      displayName: doc["displayName"],
      bio: doc["bio"],
      profiletype: doc["profiletype"]
    );
  }

}