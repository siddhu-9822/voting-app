import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/home_screen.dart';
import 'package:flutter_vote/screen/profile_screen.dart';
import 'package:flutter_vote/screen/result_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';
import 'package:flutter_vote/widgets/custom_candidateInfo%20.dart';

class VoterListScreen extends StatelessWidget {
  const VoterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.38; // 40% of screen width

    Widget buildCandidate({
      required String image,
      required String name,
      required String description,
      required VoidCallback onProfile,
      required VoidCallback onVote,
    }) {
      return Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            CandidateInfo(
              imagePath: image,
              name: name,
              description: description,
            ),
            SizedBox(height: screenWidth * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: buttonWidth,
                  child: CustomButton(
                    text: 'VIEW PROFILE',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: buttonWidth,
                  child: CustomButton(
                    text: 'VOTE',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text("Election Members List"),
      ),
      body: ListView(
        padding: EdgeInsets.all(screenWidth * 0.06),
        children: [
          buildCandidate(
            image: 'asset/images/avatar2.png',
            name: 'Siddheshwar Kamjalge',
            description:
                "Voting gives you the power to choose your own leader.",
            onProfile: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultScreen()),
              );
            },
            onVote: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultScreen()),
              );
            },
          ),
          SizedBox(height: screenWidth * 0.1),
          buildCandidate(
            image: 'asset/images/avatar1.png',
            name: 'Shekhar Tikhe',
            description:
                "I'm a candidate focused on equity and diversity embedded in education.",
            onProfile: () {},
            onVote: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultScreen()),
              );
            },
          ),
          SizedBox(height: screenWidth * 0.1),
          buildCandidate(
            image: 'asset/images/avatar3.png',
            name: 'Satyam Wadje',
            description:
                "Let your voice be heard and work towards the fulfillment of your needs.",
            onProfile: () {},
            onVote: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
