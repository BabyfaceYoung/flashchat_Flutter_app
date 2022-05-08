import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('SomethingWentWrong');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(initialRoute: 'WelcomeScreen', routes: {
            'WelcomeScreen': (context) => WelcomeScreen(),
            'ChatScreen': (context) => ChatScreen(),
            'LoginScreen': (context) => LoginScreen(),
            'RegistrationScreen': (context) => RegistrationScreen(),
          });
        }
      },
    );
  }
}
