import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/home_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';
import 'package:flutter_vote/widgets/result_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int counter = 0;
  int counte = 0;
  int count = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0; // Siddheshwar Kamjalge
      counte = prefs.getInt('counte') ?? 0; // Satyam Wadje
      count = prefs.getInt('count') ?? 0; // Shekhar Tikhe
    });
  }

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
                imagePath: 'assets/images/avatar2.png',
                name: 'Siddheshwar Kamjalge',
                progressValue: counter / 1000,
                currentScore: counter,
                maxScore: 1000,
              ),
              SizedBox(height: screenHeight * 0.03),
              // candidate 2
              ResultList(
                imagePath: 'assets/images/avatar3.png',
                name: 'Satyam Wadje',
                progressValue: counte / 1000,
                currentScore: counte,
                maxScore: 1000,
              ),
              SizedBox(height: screenHeight * 0.03),
              // candidate 3
              ResultList(
                imagePath: 'assets/images/avatar1.png',
                name: 'Shekhar Tikhe',
                progressValue: count / 1000,
                currentScore: count,
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
