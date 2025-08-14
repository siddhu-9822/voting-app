import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/home_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.15,
            right: screenWidth * 0.08,
            left: screenWidth * 0.08,
          ),
          child: Column(
            children: [
              Text(
                "Hi Siddheshwar!\nWelcome to\nWeVote.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.09,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Your account has been created\nsuccessfully",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.05),
              Image.asset(
                'asset/images/welcome_vote.png',
                height: screenHeight * 0.3,
                width: screenWidth * 0.7,
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.05),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
