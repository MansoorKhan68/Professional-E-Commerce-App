import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id; // Document ID
  final String firstName; // User's first name
  final String lastName; // User's last name
  final String username; // User's username
  final String email; // User's email
  final String phoneNumber; // User's phone number
  // final String profilePicture; // URL to the profile picture

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    // required this.profilePicture,
  });

  // Factory method to create a UserModel from a Firestore document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id, // Use Firestore document ID
      firstName: data['firstName'] ?? "", // Map 'firstName' field
      lastName: data['lastName'] ?? "", // Map 'lastName' field
      username: data['username'] ?? "", // Map 'username' field
      email: data['email'] ?? "", // Map 'email' field
      phoneNumber: data['phoneNumber'] ?? "", // Map 'phoneNumber' field
      // profilePicture: data['profilePicture'] ?? "", // Map 'profilePicture' field
    );
  }

  // Method to convert UserModel to a JSON map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      // 'profilePicture': profilePicture,
    };
  }
}
