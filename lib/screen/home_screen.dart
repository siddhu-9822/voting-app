import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/voter_list_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';
import 'package:flutter_vote/widgets/custom_voteInfocard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.08,
        leading: IconButton(
          icon: Icon(
            Icons.home_outlined,
            color: Colors.black,
            size: screenWidth * 0.09,
          ),
          onPressed: () {},
        ),
        title: Image.asset(
          'assets/images/vote_logo.png',
          height: screenHeight * 0.12,
          width: screenWidth * 0.8,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
              size: screenWidth * 0.09,
            ),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.025,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    VoteInfoCard(
                      title: "Vote For \n Club President Election",
                      dateInfo: "Oct 1st - Oct 10th (9 am - 5 pm)",
                      description:
                          "Class presidents work to represent the needs and opinions of their class within the student council.",
                      backgroundColor: const Color.fromARGB(255, 240, 206, 226),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    VoteInfoCard(
                      title: "Vote For\n Class Monitor",
                      dateInfo: "Sep 12th - Sep 28th (9 am - 5 pm)",
                      description:
                          "Class monitors maintain discipline, coordinate activities, and represent their classmates to staff.",
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    VoteInfoCard(
                      title: "Vote For\n Students Representative",
                      dateInfo: "Aug 22nd - Sep 25th (8 am - 10 pm)",
                      description:
                          "Student reps lobby for students' rights and represent peers' views.\n  ",
                    ),
                  ],
                ),
              ),
            ),

            // Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _dot(true, screenWidth),
                SizedBox(width: screenWidth * 0.015),
                _dot(false, screenWidth),
                SizedBox(width: screenWidth * 0.015),
                _dot(false, screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * 0.10),

            // Title
            Text(
              "Candidates list",
              style: TextStyle(
                fontSize: screenWidth * 0.055,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Candidates list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _candidate(
                    "assets/images/avatar1.png",
                    "Shekhar\nTikhe",
                    screenWidth,
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  _candidate(
                    "assets/images/avatar2.png",
                    "Siddheshwar\nKamjalge",
                    screenWidth,
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  _candidate(
                    "assets/images/avatar3.png",
                    "Satyam\nWadje",
                    screenWidth,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.09),

            // Vote button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12),
              child: CustomButton(
                text: 'Vote Now',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VoterListScreen(),
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

  Widget _dot(bool isActive, double screenWidth) {
    return Container(
      width: isActive ? screenWidth * 0.04 : screenWidth * 0.03,
      height: isActive ? screenWidth * 0.04 : screenWidth * 0.03,
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromARGB(255, 240, 206, 226)
            : const Color(0xffF8E2EE),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _candidate(String image, String name, double screenWidth) {
    return Column(
      children: [
        CircleAvatar(
          radius: screenWidth * 0.13,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(height: screenWidth * 0.025),
        Text(
          name,
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
