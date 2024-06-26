import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_trustmebro/models/post.dart';
import 'package:project_trustmebro/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  Future<String> uploadPost(
    String product,
    String description,
    //Uint8List file,
    String uid,
    String username,
    //String profImage,
  ) async {
    String res = "Some error occurred";
    try {
      //String photoUrl = await StorageMethods().uploadImagetoStorage('posts', file, true);
      String postId = const Uuid().v1();

      Post post = Post(
        product: product,
        description: description,
        uid: uid,
        username: username,
        postId: postId,
      );//datePublished: DateTime.now(),
//profImage: profImage, 
        //postUrl: photoUrl,
      _firestore.collection('givePosts').doc(postId).set(
            post.toJson(),
          );
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
