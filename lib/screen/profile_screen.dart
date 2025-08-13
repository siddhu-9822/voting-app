import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/result_screen.dart';
import 'package:flutter_vote/screen/voter_list_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VoterListScreen()),
            );
          },
        ),
        title: const Text("Club President Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.08),
            Center(
              child: CircleAvatar(
                radius: screenWidth * 0.18,
                backgroundImage: const AssetImage('asset/images/avatar2.png'),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              "Siddheshwar Kamjalge",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "ABOUT",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(width: screenWidth * 0.06),
                // Left Column
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildLabel("Name", screenWidth),
                      buildLabel("Course", screenWidth),
                      buildLabel("Year", screenWidth),
                      buildLabel("Mob", screenWidth),
                      buildLabel("College", screenWidth),
                    ],
                  ),
                ),
                // Right Column
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildValue(": Siddheshwar Kamjalge", screenWidth),
                      buildValue(": Dip. In Computer engineering", screenWidth),
                      buildValue(": 3rd (B)", screenWidth),
                      buildValue(": 9921047746", screenWidth),
                      buildValue(": Gramin Technical &", screenWidth),
                      buildValue("   Management Campus", screenWidth),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.08),
            CustomButton(
              text: 'Vote',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResultScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.05),
      child: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.043,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget buildValue(String text, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.05),
      child: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.043,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
