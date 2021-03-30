import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/progress.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users = [];
  @override
  void initState(){
    //getUsers();
    //getUserById();
    //createUser();
    //updateUser();
    //deleteUser();
    super.initState();
  }

  //getUserById() async {
  //  final String ID = "uz1Tht7R3sS014OE7kS3";
  //  final DocumentSnapshot doc = await usersRef.doc(ID).get();
  //  //    .then((doc){
  //    print(doc.data());
  //    print(doc.exists);
  //    print(doc.id);
    //});
  //}

  //getUsers() async{
  //  final QuerySnapshot snapshot = await usersRef.get();
  //  setState(() {
  //    users = snapshot.docs;
  //  });
  //}

  //getUserss(){
  //  usersRef.where("username",isLessThan: 3).get().then((QuerySnapshot querySnapshot){
  //    querySnapshot.docs.forEach((doc) {
  //      print(doc.data());
  //      print(doc.exists);
  //      print(doc.id);
  //    });
  //  });
  //}

  createUser() {
     usersRef.doc("asdaaasda").set({
     "username": "Jhon",
      "postCount": 6,
      "isAdmin": false,
    });
  }

  updateUser() async {
    final doc = await usersRef
        .doc("uz1Tht7R3sS014OE7kS3").get();
    if(doc.exists){
      doc.reference.update({
        "username": "Jhon",
        "postCount": 6,
        "isAdmin": false
      });
    }
  }
  deleteUser() async{
    final DocumentSnapshot doc = await usersRef
        .doc("uz1Tht7R3sS014OE7kS3").get();
    if(doc.exists){
      doc.reference.delete();
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      //appBar: header(
      //  context,
      //  isAppTitle: true
      //),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData){
            return circularProgress(context);
          }
          final List<Text> children = snapshot.data.docs.map((doc) => Text(doc["username"]))
          .toList();
          return Container(
            child: ListView(
              children: children,
            ),
          );
        },
      )
    );
  }
}