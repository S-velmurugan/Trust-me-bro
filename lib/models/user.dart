import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
   final String email;
   final String uid;
   final String photoUrl;
   final String username;
   final String bio;
   //final List friends;
   final int lent;
   final int borrowed;

   const User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    //required this.friends,
    required this.lent,
    required this.borrowed,
   });

   Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,
    "bio": bio,
    //"friends": friends,
    "lent": lent,
    "borrowed": borrowed,
   };

   static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['emain'],
      photoUrl: snapshot['photoUrl'],
      bio: snapshot['bio'],
      //friends: snapshot['friends'],
      lent: snapshot['lent'],
      borrowed: snapshot['borrowed'],
    );
   }
}