import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khyber_kart/app.dart';
import 'package:khyber_kart/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    /*
     use then function
    and after this we will use AuthenticationRepository
     it will check the current state of the user before re directed to the next screen
     */
  );
  runApp(const App());
}
