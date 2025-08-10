import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, right: 30, left: 30),
          child: Column(
            children: [
              Text(
                "Hi Siddheshwar!\nWelcome to\nWeVote.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Text(
                "Your account has been created\nsuccessfully",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Image.asset(
                'asset/images/welcome_vote.png',
                height: 300,
                width: 300,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Sign Up Screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5B81FE),
                  minimumSize: const Size(double.infinity, 50),
                ),

                child: const Text(
                  'Contine',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
