import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/timeline.dart';
import 'package:fluttershare/widgets/progress.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/user.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchController = TextEditingController();

  Future<QuerySnapshot> searchResultFuture;

  handleSearch(String query){
    Future<QuerySnapshot> users = usersRef
        .where("displayName", isGreaterThanOrEqualTo: query)
        .get();
      setState(() {
        searchResultFuture = users;
      });
  }

  clearSearch(){
    searchController.clear();
  }

  AppBar buildSearchField(context){
    return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Search for a user...",
          filled: true,
          prefixIcon: Icon(
            Icons.account_box,
            size: 28.0
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: clearSearch,
          )
        ),
       onFieldSubmitted: handleSearch,
      ),
    );

  }
  buildSearchResults(){
    return FutureBuilder(
      future: searchResultFuture,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return circularProgress(context);
        }
        List<UserResult> searchResults = [];
        snapshot.data.docs.forEach((doc){
          User user = User.fromDocument(doc);
          UserResult searchResult = UserResult(user);
          searchResults.add(searchResult);
        });
        return ListView(
          children: searchResults,
        );
      },
    );
  }

  buildNocontent(context){
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
          SvgPicture.asset("assets/Images/search.svg", height: 300, ),
            Text("Find Users", textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 60.0
            ),)

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
      appBar: buildSearchField(context),
      body: searchResultFuture == null ? buildNocontent(context) :
      buildSearchResults(),
    );
  }
}

class UserResult extends StatelessWidget {
  final User user;
  UserResult(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => print("tapped"),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(user.photoUrl),
              ),
              title: Text(user.displayName, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text(user.username, style: TextStyle(
                color: Colors.white
              ),),
            )
          ),
          Divider(
            height: 2.0,
            color: Colors.white54
          )
        ],
      )

    );
  }
}