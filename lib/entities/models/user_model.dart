// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserApp extends Equatable {
  final String? id;
  final String fullName;
  final String age;
  final String imageAvatar;
  final List<dynamic>? imageUrl;
  final String gender;
  final String phoneNumber;
  final String status;

  const UserApp(
      {this.id,
      this.age = '',
      this.gender = '',
      this.imageAvatar = '',
      this.imageUrl,
      this.fullName = '',
      this.phoneNumber = '',
      this.status = ''});
  UserApp copyWith({
    String? id,
    String? fullName,
    String? age,
    String? imageAvatar,
    List<dynamic>? imageUrl,
    String? gender,
    String? phoneNumber,
    String? status,
  }) {
    return UserApp(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      imageAvatar: imageAvatar ?? this.imageAvatar,
      imageUrl: imageUrl ?? this.imageUrl,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [id, fullName, age, gender, imageAvatar, imageUrl, phoneNumber, status];

  Map<String, Object> toDocument() {
    return {
      'id': id!,
      'fullName': fullName,
      'age': age,
      'imageAvatar': imageAvatar,
      'imageUrl': imageUrl!,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'status': status,
    };
  }

  factory UserApp.fromSnapshot(DocumentSnapshot snap) {
    return UserApp(
      id: snap.id,
      fullName: snap['fullName'],
      age: snap['age'],
      imageAvatar: snap['imageAvatar'],
      imageUrl: snap['imageUrl'],
      gender: snap['gender'],
      phoneNumber: snap['phoneNumber'],
      status: snap['status'],
    );
  }
}
