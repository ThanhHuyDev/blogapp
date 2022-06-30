import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final int age;
  final List<String> imageUrl;
  final String gender;
  final String phoneNumber;
  final String status;

  const User(
      {required this.id,
      required this.age,
      required this.gender,
      required this.imageUrl,
      required this.name,
      required this.phoneNumber,
      required this.status});
  @override
  List<Object?> get props =>
      [id, name, age, gender, imageUrl, phoneNumber, status];
  static List<User> users = [
    const User(
        id: 1,
        age: 22,
        gender: 'name',
        imageUrl: [
          'https://scontent.fdad3-1.fna.fbcdn.net/v/t39.30808-6/286899290_164446899384811_3295116398456047817_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=JPKD6OWgd5kAX8hXdBN&_nc_oc=AQklnPyme5tuYAwDTrrAN2RwocCiHx_LyKWuNzQNTIYiziuOibx_4R1hzLwRDHNxTWwJ96MWZ7ksfUw-lpQhTcwP&_nc_ht=scontent.fdad3-1.fna&oh=00_AT81reVny-glW87ELxtwoAEEpAMzsaYzdqnk58FRwCviMA&oe=62C259ED'
        ],
        name: 'Huy',
        phoneNumber: '0344544668',
        status: 'love #T'),
  ];
}
