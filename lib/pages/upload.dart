import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttershare/widgets/progress.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../classes/user.dart';
import 'package:cached_network_image/src/image_provider/cached_network_image_provider.dart';
import '../widgets/progress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';
import '../widgets/AuthPage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:location/location.dart' as loc;


final positionsRef = FirebaseFirestore.instance.collection("allpositions");

class Upload extends StatefulWidget {
  final User currentUser;

  Upload({this.currentUser});

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  List<String> keysRetrieved = [];
  loc.Location postLoc = loc.Location();
  TextEditingController locationInputController = TextEditingController();
  TextEditingController positionlngInputController = TextEditingController();
  TextEditingController positionlatInputController = TextEditingController();
  TextEditingController captionInputController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  bool isUploading = false;
  String postId = Uuid().v4();

//
  var postPosition;
  void initState(){
    super.initState();
  }

//


  Future handleTakePhoto() async {
    Navigator.pop(context);
    final image = await picker.getImage(source: ImageSource
        .camera,
      maxHeight: 675,
      maxWidth: 960
    );
    setState(() {
      if(image != null){
        _image = File(image.path);
      }else{
        print("noImage from camera");
      }

    });
  }

  handleChooseFromGallery() async {
    Navigator.pop(context);
    final image = await picker.getImage(source: ImageSource.gallery,);
    setState(() {
      if(image != null){
        _image = File(image.path);
      }else{
        print("noImage from camera");
      }

    });
}



  SelectImage(parentContext){
    return showDialog(
      context: parentContext,
      builder: (context){
        return SimpleDialog(
          title: Text("Create Post"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Photo with Camera"),
              onPressed: handleTakePhoto,
            ),
            SimpleDialogOption(
              child: Text("Image from Gallery"),
              onPressed: handleChooseFromGallery,
            ),
            SimpleDialogOption(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context)
            ),
          ],
        );
      }
    );
  }

  Container buildSplashScreen(){
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset("assets/Images/upload.svg", height: 260.0),
          Padding(padding: EdgeInsets.only(top: 20),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text("Upload Image", style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
              ),
              color: Colors.indigo,
              onPressed: () => SelectImage(context),
            ),
          )
        ],
      ),
    );
  }
  clearImage(){
    setState(() {
      _image = null;
    });
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(_image.readAsBytesSync());
    final compressedImageFile = File("$path/img_$postId.jpg")..writeAsBytes(
      Im.encodeJpg(imageFile, quality: 85)
    );
    setState(() {
      _image = compressedImageFile;
    });
  }

  Future<String> uploadImage(imageFile) async{
    UploadTask uploadTask = storageRef
        .child("post_$postId.jpg").putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<DocumentReference> _addGeoPoint() async{
    var pos = await postLoc.getLocation();
    //GeoPoint point = geo;
  }


  createPostInFirestore({String mediaUrl, String location, String positionlat, String positionlng
      , String description}){
    postRef
    .doc(widget.currentUser.id)
        .collection("userPosts")
        .doc(postId)
        .set({
      "postId": postId,
      "ownerId": widget.currentUser.id,
      "username": widget.currentUser.username,
      "mediaUrl": mediaUrl,
      "description": description,
      "location": location,
      "position": [double.parse(positionlat),positionlng],
      "timestamp": timestamp,
      "likes": {},
    });
    positionsRef.add({
      "position": [double.parse(positionlat),double.parse(positionlng)],
      "postId": postId,
      "mediaUrl":mediaUrl,
    });

  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
      getUserPosition();
      String mediaUrl = await uploadImage(_image);
      createPostInFirestore(
        mediaUrl: mediaUrl,
        location: locationInputController.text,
        description: captionInputController.text,
        positionlat: positionlatInputController.text,
        positionlng: positionlngInputController.text,
      );


    captionInputController.clear();
    locationInputController.clear();
    positionlatInputController.clear();
    positionlngInputController.clear();

    setState(() {
      _image = null;
      isUploading = false;
      //to create new id for new posts (no overwritten new posts)
      postId = Uuid().v4();
    });
  }

  Scaffold buildUploadForm(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: clearImage,
        ),
        title: Text("Caption Post"
          ,style: TextStyle(color: Colors.black),
        ),
        actions: [
          FlatButton(onPressed: isUploading ? null : () => handleSubmit(),
          child: Text("Post", style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          isUploading ? linearProgress(context) : Text(""),
          Container(
            height: 220.0,
            width: MediaQuery.of(context).size.width*0.85,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/15,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(_image)
                    )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                widget.currentUser.photoUrl
              ),
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: captionInputController,
                decoration: InputDecoration(
                  hintText: "Write a caption...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.pin_drop,
              color: Theme.of(context).accentColor,
              size: 35.0,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: locationInputController,
                decoration: InputDecoration(
                  hintText: "Where was this photo taken",
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          Container(
            width: 200.0,
            height: 50,
            alignment: Alignment.center,
            child: RaisedButton.icon(
              label: Text("Use Current Location",
              style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ) ,
              color: Theme.of(context).primaryColor,
              onPressed: ()=> getUserLocation(),
              icon: Icon(
                Icons.my_location,
                color: Colors.white,
              ),
            ) ,
          ),
        ],
      ),
    );
  }
  bool isAutoLocationisused = false;

  getUserLocation() async {
    setState(() {
      isAutoLocationisused = true;
    });
    Position position = await Geolocator()
        .getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    List<Placemark> placemarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark placemark = placemarks[0];
    //String completeAddress = "${placemark.subThoroughfare} ${placemark.thoroughfare}, ${placemark.subLocality}"
    ;
    positionlngInputController.text = (position.longitude).toString();
    positionlatInputController.text = (position.latitude).toString();
    print(position.latitude.toString());
    print("locationtapped");
    String formattedAddress = "${placemark.subAdministrativeArea},${placemark.administrativeArea},${placemark.country}";
    print(formattedAddress);
    locationInputController.text = formattedAddress;
  }

  getUserPosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    positionlngInputController.text = (position.longitude).toString();
    positionlatInputController.text = (position.latitude).toString();
  }


  @override
  Widget build(BuildContext context) {
    return _image == null ? buildSplashScreen() : buildUploadForm();
  }
}