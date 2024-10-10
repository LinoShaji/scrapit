import 'package:scrapit/features/authentication_and_user_details_fetching/domain/entites/friends.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String bio;
  final List<Friends> friends;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.bio,
    required this.friends
  });
}
