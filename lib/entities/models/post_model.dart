import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String? id;
  final String? idUser;
  final String? caption;
  final String? imagePost;
  final String? time;
  Post({
    this.id,
    this.idUser,
    this.caption,
    this.imagePost,
    this.time,
  });
  factory Post.fromJson(DocumentSnapshot snap) {
    return Post(
      id: snap['id'],
      idUser: snap['idUser'],
      caption: snap['caption'],
      imagePost: snap['imagePost'],
      time: snap['time'],
    );
  }
  Map<String, Object> toJson() {
    return {
      'id': id!,
      'idUser': idUser!,
      'caption': caption!,
      'imagePost': imagePost!,
      'time': time!,
    };
  }
}
