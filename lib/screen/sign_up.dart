import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Text("Create Account", style: TextStyle(fontSize: 36)),
            ),
            const Spacer(),
            Image.asset('asset/images/vote_logo.png', height: 100, width: 200),

            const Spacer(),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: const Color.fromARGB(20, 0, 0, 0),
                labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              style: const TextStyle(color: Colors.black, fontSize: 22),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: const Color.fromARGB(20, 0, 0, 0),
                labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              style: const TextStyle(color: Colors.black, fontSize: 22),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                filled: true,
                fillColor: const Color.fromARGB(20, 0, 0, 0),
                labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              style: const TextStyle(color: Colors.black, fontSize: 22),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: const Color.fromARGB(20, 0, 0, 0),
                labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              style: const TextStyle(color: Colors.black, fontSize: 22),
            ),
            // SizedBox(height: 100),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to Sign Up Screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff5B81FE),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to Sign Up Screen
                  },
                  child: const Text(
                    "Log In.",
                    style: TextStyle(color: Colors.blue, fontSize: 17),
                  ),
                ),
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
