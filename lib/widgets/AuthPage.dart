import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttershare/pages/maps.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../pages/activity_feed.dart';
import '../pages/profile.dart';
import '../pages/search.dart';
import '../pages/timeline.dart';
import '../pages/upload.dart';
import '../pages/maps.dart';
import '../pages/timeline.dart';
import '../pages/create_account.dart';

import '../classes/user.dart';
import '../XDAddPost2.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final Reference storageRef = FirebaseStorage.instance.ref();
final usersRef = FirebaseFirestore.instance.collection("users");
final postRef = FirebaseFirestore.instance.collection("posts");
final DateTime timestamp = DateTime.now();
User currentUser;

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isAuth = false;
  PageController pageController;
  int pageIndex = 0;
  @override
  void initState(){
    super.initState();
    pageController = PageController(
      initialPage: 0
    );
    // Detects when user signed in
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
      handleSignIn(account);
    }, onError: (err){
      print("Error signing in: $err");
    });
    //Reauthenticate user when app is opened
    googleSignIn.signInSilently(suppressErrors: false)
    .then((account){
      handleSignIn(account);
    }).catchError((err){
      print("Error signing in: $err");
    });
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  handleSignIn(GoogleSignInAccount account){
    if (account != null){
      createUserInFirestore();
      setState(() {
        isAuth = true;
      });
    }else{
      setState(() {
        isAuth = false;
      });
    }
  }

  createUserInFirestore() async {
    // check if user exists in users collection
    // in database(according to theri id)
    final GoogleSignInAccount user = googleSignIn.currentUser;
    DocumentSnapshot doc = await usersRef.doc(user.id).get();

    if(!doc.exists){
      //if the user does not exist, we want to take
      // them to the create account page
      final username = await Navigator.push(context, MaterialPageRoute(
        builder:(context) => CreateAccount()
      ));
      //get username from account create account, use
      // it to make new user dobumnet in users collection

      usersRef.doc(user.id).set({
        "profiletype": "",
        "id": user.id,
        "username": username,
        "photoUrl": user.photoUrl,
        "email": user.email,
        "displayName": user.displayName,
        "bio": "",
        "timeStamp": timestamp
      });
      doc = await usersRef.doc(user.id).get();
    }
    
    currentUser = User.fromDocument(doc);
    print(currentUser);
    print(currentUser.username);
  }


  login(){
    googleSignIn.signIn();
  }

  logout(){
    googleSignIn.signOut();
  }

  onPageChanged(int pageIndex){
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex){
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
     curve: Curves.easeInOut
    );
  }

  Scaffold buildAuthScreen(){
    return Scaffold(
      body: PageView(
        children: <Widget>[
          //Timeline(),
          //RaisedButton(
         //   child: Text("LogOut"),
         //   onPressed: logout,
        //  ),
          Timeline(),
          Search(),
          Maps(),
          Upload(currentUser: currentUser),
          Profile(profileId: currentUser?.id),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: SizedBox(height: 58,child: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onTap,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Color(0xffCCCCCC),
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot,size: 28,),label: 'Posts'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on),label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity),label: 'Profile'),
        ],
      ),
    )
    );
  }

  Widget buildUnAuthScreen(){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ]
          )
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("EcoSphere",
            style: TextStyle(
              fontFamily: "Signatra",
              fontSize: 80.0,
              color: Colors.white),
            ),
            GestureDetector(
              onTap: login,
              child: Container(
                width: 260,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Images/google_signin_button.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}

