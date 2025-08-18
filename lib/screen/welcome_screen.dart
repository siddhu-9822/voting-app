import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/home_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String username = '';

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'User'; // fallback
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: username.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.15,
                  right: screenWidth * 0.08,
                  left: screenWidth * 0.08,
                ),
                child: Column(
                  children: [
                    Text(
                      "Hi $username!\nWelcome to\nWeVote.",
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
                      'assets/images/welcome_vote.png',
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.7,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    CustomButton(
                      text: 'Continue',
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('isFirstLoginComplete', true);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
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
