import 'package:flutter/material.dart';
import 'package:flutter_vote/widgets/custom_candidateInfo%20.dart';
// import 'package:flutter_vote/widgets/voter_list_card.dart';

class VoterListScreen extends StatefulWidget {
  const VoterListScreen({super.key});

  @override
  State<VoterListScreen> createState() => _VoterListScreenState();
}

class _VoterListScreenState extends State<VoterListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Text("Election Members List"),
      ),
      body: ListView(
        padding: EdgeInsets.all(26),
        children: [
          // Candidate 1
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                CandidateInfo(
                  imagePath: 'asset/images/avatar2.png',
                  name: 'Siddheshwar Kamjalge',
                  description:
                      "Voting gives you the power to choose your own leader.",
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5B81FE),
                        minimumSize: const Size(200, 50),
                      ),
                      child: Text(
                        "VIEW PROFILE",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5B81FE),
                        minimumSize: const Size(200, 50),
                      ),
                      child: Text(
                        "VOTE",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Candidate 2 (just change data)
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                CandidateInfo(
                  imagePath: "asset/images/avatar1.png",
                  name: 'Shekhar Tikhe',
                  description:
                      "I'm a candidate focused on equity and diversity embedded in education.",
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5B81FE),
                        minimumSize: const Size(200, 50),
                      ),
                      child: Text(
                        "VIEW PROFILE",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5B81FE),
                        minimumSize: const Size(200, 50),
                      ),
                      child: Text(
                        "VOTE",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Candidate 3 (just change data)
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                CandidateInfo(
                  imagePath: 'asset/images/avatar3.png',
                  name: 'Satyam Wadje',
                  description:
                      "Let your voice be heard and work towards the dulfillment fo your needs.",
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5B81FE),
                        minimumSize: const Size(200, 50),
                      ),
                      child: Text(
                        "VIEW PROFILE",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5B81FE),
                        minimumSize: const Size(200, 50),
                      ),
                      child: Text(
                        "VOTE",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
