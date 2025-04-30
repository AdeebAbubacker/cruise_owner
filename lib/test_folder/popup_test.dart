import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PopupTest extends StatelessWidget {
  const PopupTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('My Cruise'),
                    content: Text('This is a popup!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              "Open my cruise",
            ),
          )
        ],
      )),
    );
  }
}

class QuestionsList extends StatelessWidget {
  const QuestionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final userCredential = await AuthService.signInWithGoogle();
            if (userCredential != null) {
              // Login Success
              final user = userCredential.user;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Logged in as ${user?.displayName}')),
              );
            } else {
              // Login Failed or Cancelled
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login cancelled or failed')),
              );
            }
          },
          child: const Text('Login with Google'),
        ),
      ),
    );
  }
}

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // Cancelled

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In error: $e");
      return null;
    }
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
