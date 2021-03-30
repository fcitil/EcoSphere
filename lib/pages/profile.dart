import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/progress.dart';
import '../widgets/AuthPage.dart';
import '../widgets/header.dart';
import '../classes/user.dart';
import '../widgets/progress.dart';
import '../widgets/AuthPage.dart';
class Profile extends StatefulWidget {
  final String profileId;
  Profile({this.profileId});

  @override
  _ProfileState createState() => _ProfileState();
}

logout(){
  googleSignIn.signOut();
}
class _ProfileState extends State<Profile> {
  buildProfileHeader(){
    return FutureBuilder(
      future: usersRef.doc(widget.profileId).get(),
      builder: (context, snapshot){
        if (!snapshot.hasData){
          return circularProgress(context);
        }
        User user = User.fromDocument(snapshot.data);
        return Container(
          color: Colors.white,
          child: Row(
            children:<Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    user.username,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30),
                  child:IconButton(
                      icon: Icon(Icons.label),
                      onPressed: null,
                      color: Colors.green,
                  )
              ),
              RaisedButton(
                child: Text("LogOut"),
                onPressed: logout,
              )
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildProfileHeader(),
          Container(
            height: 89,
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,)
        ],
      ),
    );
  }
}
