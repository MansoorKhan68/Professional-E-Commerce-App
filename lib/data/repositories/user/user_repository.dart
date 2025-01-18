import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:khyber_kart/features/authentication/model/user_model.dart';
import 'package:khyber_kart/utils/exceptions/firebase_exceptions.dart';
import 'package:khyber_kart/utils/exceptions/platform_exceptions.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      print("Saving user record: ${user.toJson()}");
      await _db.collection("Users").doc(user.id).set(user.toJson());
      print("User record saved successfully.");
      // Add navigation logic here if needed
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.code}");
      throw TFirebaseException(e.code);
    } on FormatException {
      print("FormatException: Invalid format provided");
      throw const FormatException("Invalid format provided");
    } on TFirebaseException catch (e) {
      print("TFirebaseException: ${e.code}");
      throw TPlatformException(e.code);
    } catch (e) {
      print("Exception: Something went wrong. Please try again. Error: $e");
      throw Exception("Something went wrong. Please try again.");
    }
  }
}