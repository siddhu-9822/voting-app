import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/home_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';
import 'package:flutter_vote/widgets/result_list.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Center(
          child: Text(
            "Result of Election",
            style: TextStyle(
              fontSize: screenWidth * 0.07,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              // candidate 1
              ResultList(
                imagePath: 'asset/images/avatar2.png',
                name: 'Siddheshwar Kamjalge',
                progressValue: 0.42,
                currentScore: 420,
                maxScore: 1000,
              ),
              SizedBox(height: screenHeight * 0.03),
              // candidate 2
              ResultList(
                imagePath: 'asset/images/avatar3.png',
                name: 'Satyam Wadje',
                progressValue: 0.3,
                currentScore: 300,
                maxScore: 1000,
              ),
              SizedBox(height: screenHeight * 0.03),
              // candidate 3
              ResultList(
                imagePath: 'asset/images/avatar1.png',
                name: 'Shekhar Tikhe',
                progressValue: 0.25,
                currentScore: 250,
                maxScore: 1000,
              ),
              SizedBox(height: screenHeight * 0.25),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.02,
                ),
                // Home Button
                child: CustomButton(
                  text: "Home",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
