import 'package:flutter/material.dart';
import 'package:flutter_vote/widgets/custom_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,

        leading: IconButton(
          icon: Icon(Icons.home_outlined, color: Colors.black, size: 50),
          onPressed: () {},
        ),
        title: Image.asset(
          'asset/images/vote_logo.png',
          height: 70,
          width: 200,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
              size: 50,
            ),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VoteInfoCard(
                    title: "Vote For \n Class President Election",
                    dateInfo: "October 1st to October 10th - 9 am to 5 pm",
                    description:
                        "Class presidents work to represent the needs and opinions of their class within the student council.",
                    backgroundColor: Color.fromARGB(255, 188, 166, 178),
                  ),
                  const SizedBox(width: 20),
                  VoteInfoCard(
                    title: "Vote For\n Class Moniter",
                    dateInfo: "September 12th to September 28th - 9 am to 5 pm",
                    description:
                        "Class monitors work to maintain discipline, coordinate activities, and represent the needs of their classmates to teachers and school staff.",
                  ),
                  SizedBox(width: 20),
                  VoteInfoCard(
                    title: "Vote for \n Students Representative",
                    dateInfo: "August 22th to September 25th - 8 am to 10 pm",
                    description:
                        "Student representatives are known as enrolled scholars at their institution elected to lobby for students' rights and represent their peers' views.",
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 188, 166, 178), // dot color
                  shape: BoxShape.circle, // makes it round
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 15,
                height: 15,
                decoration: const BoxDecoration(
                  color: Color(0xffF8E2EE), // dot color
                  shape: BoxShape.circle, // makes it round
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 15,
                height: 15,
                decoration: const BoxDecoration(
                  color: Color(0xffF8E2EE), // dot color
                  shape: BoxShape.circle, // makes it round
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            "Candidates list",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 70, // size
                      backgroundImage: AssetImage(
                        "asset/images/avatar1.png",
                      ), // asset image
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Shekhar\nTikhe",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 70, // size
                      backgroundImage: AssetImage(
                        "asset/images/avatar2.png",
                      ), // asset image
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Siddheshwar\nKamjalge",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 70, // size
                      backgroundImage: AssetImage(
                        "asset/images/avatar3.png",
                      ), // asset image
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Satyam\nWadje",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff5B81FE),
                minimumSize: const Size(450, 50),
              ),
              child: const Text(
                'Vote',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
