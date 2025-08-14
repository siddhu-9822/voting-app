import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/home_screen.dart';
import 'package:flutter_vote/screen/profile_screen/profile_screen_i.dart';
import 'package:flutter_vote/screen/profile_screen/profile_screen_ii.dart';
import 'package:flutter_vote/screen/profile_screen/profile_screen_iii.dart';
import 'package:flutter_vote/screen/result_screen.dart';
import 'package:flutter_vote/widgets/custom_candidateinfo.dart';

class VoterListScreen extends StatelessWidget {
  const VoterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
          CandidateCard(
            image: 'asset/images/avatar2.png',
            name: 'Siddheshwar Kamjalge',
            description:
                "Voting gives you the power to choose your own leader.",
            profileScreen: ProfileScreen1(),
            onVote: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultScreen()),
              );
            },
          ),
          SizedBox(height: screenWidth * 0.1),
          CandidateCard(
            image: 'asset/images/avatar1.png',
            name: 'Shekhar Tikhe',
            description:
                "I'm a candidate focused on equity and diversity embedded in education.",
            profileScreen: ProfileScreen2(),
            onVote: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultScreen()),
              );
            },
          ),
          SizedBox(height: screenWidth * 0.1),
          CandidateCard(
            image: 'asset/images/avatar3.png',
            name: 'Satyam Wadje',
            description:
                "Let your voice be heard and work towards the fulfillment of your needs.",
            profileScreen: ProfileScreen3(),
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
