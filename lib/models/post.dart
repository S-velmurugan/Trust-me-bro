import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String product;
   final String description;
   final String uid;
   final String username;
   final String postId;
   //final DateTime datePublished;
   //final String postUrl;
   //final String profImage;

   const Post({
    required this.product,
    required this.uid,
    required this.username,
    required this.description,
    required this.postId,
    //required this.datePublished,
    //required this.profImage,
    //required this.postUrl,
   });

   Map<String, dynamic> toJson() => {
   "product": product,
   //"postUrl": postUrl,
   "uid": uid,
   "username": username,
   "description": description,
   "postId": postId,
   //"datePublished": datePublished,
   //"profImage": profImage,
   };

   static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      product: snapshot['product'],
      username: snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      postId: snapshot['postId'],
      //datePublished: snapshot['datePublished'],
      //profImage: snapshot['profImage'],
      //postUrl: snapshot['postUrl']
    );
   }
}