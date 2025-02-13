import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  Future<void> _handleGoogleSignIn() async {
    try {
      print("Starting Google Sign-In process...");

      // Initialize Google Sign-In
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: "793947844120-od7vlmcqtbh7chhne8838t1er0nc6cnq.apps.googleusercontent.com",
        scopes: ['email', 'profile'],
        signInOption: SignInOption.standard,
      );

      // Listen for changes in the current Google user
      googleSignIn.onCurrentUserChanged.listen((user) {
        print("Current Google User: $user");
      });

      // Step 1: Attempt Google Sign-In
      print("Attempting to sign in with Google...");
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        print("Google Sign-In cancelled by the user.");
        return;
      }
      print("Google Sign-In successful. User: ${googleUser.displayName}");

      // Step 2: Get Google authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      print("Google Auth tokens retrieved. AccessToken: ${googleAuth.accessToken}");

      // Step 3: Create Firebase credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Step 4: Sign in to Firebase with the Google credential
      print("Attempting to sign in with Firebase...");
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        print("Firebase Authentication successful. User: ${user.displayName}");

        // Step 5: Retrieve a fresh ID token (force refresh if needed)
        String? idToken;
        try {
          idToken = await user.getIdToken(true); // Force refresh the token
          debugPrint("ID Token from Firebase: $idToken tadaaaa");
          print("ID Token from Vitram: $idToken");

        } catch (tokenError) {
          print("Error retrieving ID token: $tokenError");
          throw tokenError; // Re-throw the error to handle it in the outer catch block
        }

        // Step 6: Send the ID token to your backend
        if (idToken != null) {
          print("Sending ID token to the backend...");
          final response = await http.post(
            Uri.parse('https://77d0-114-10-120-175.ngrok-free.app/api/v1/users/GloginFirebase'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'idToken': idToken}),
          );

          if (response.statusCode == 200) {
            print("Backend response: ${response.body}");
          } else {
            print("Backend request failed. Status code: ${response.statusCode}");
          }
        } else {
          print("ID token is null. Cannot send to backend.");
        }
      } else {
        print("Firebase Authentication failed. No user found.");
      }
    } catch (error) {
      print("Error during Google Sign-In process: $error");
      if (error is FirebaseAuthException) {
        print("FirebaseAuthException: ${error.message}");
      } else if (error is GoogleSignInAccount) {
        print("GoogleSignInAccount Error: ${error}");
      } else {
        print("Unknown error occurred: $error");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFF1E9E5),
        padding: const EdgeInsets.all(27),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/surveyscoutlogo.png',
                  width: 200,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/surveyscout1.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 50),
                        const Text(
                          "Cari data tak pernah semudah ini",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SourceSans3',
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF705D54),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Tak perlu pusing lagi mencari responden dan data, surveyor kami akan melakukannya untuk Anda",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xFFA3948D),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Color(0xFF826754),
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(20),
                                  right: Radius.circular(20),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Color(0xFFC4B8B1),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Color(0xFFC4B8B1),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: _handleGoogleSignIn,
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF3A2B24),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              height: 17,
                              width: 17,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Daftar Dengan Google",
                              style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xFFf1e9e5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      print("Navigasi ke halaman login");
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Sudah punya akun? ",
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFa3948d),
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Masuk di sini",
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              color: Color(0xFFa3948d),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}