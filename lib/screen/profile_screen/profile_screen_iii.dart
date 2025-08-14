import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/result_screen.dart';
import 'package:flutter_vote/screen/voter_list_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';
import 'package:flutter_vote/widgets/custom_cliper.dart';

class ProfileScreen3 extends StatefulWidget {
  const ProfileScreen3({super.key});

  @override
  State<ProfileScreen3> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen3> {
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
        title: const Text("Member Profile"),
        backgroundColor: const Color.fromARGB(100, 115, 80, 212),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ProfileHeaderShape(), // The background curve
                  Positioned(
                    bottom: 0.05,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('asset/images/avatar3.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              "Satyam Wadje",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.04),
                  SizedBox(width: screenWidth * 0.04),
                  Text(
                    "ABOUT",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(width: screenWidth * 0.07),

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

                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildValue(": Satyam Wadje", screenWidth),
                      buildValue(": Dip. In Computer engineering", screenWidth),
                      buildValue(": 3rd (B)", screenWidth),
                      buildValue(": 9960728090", screenWidth),
                      buildValue(": Gramin Technical &", screenWidth),
                      buildValue("   Management Campus", screenWidth),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.07),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: CustomButton(
                text: 'Vote',
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
