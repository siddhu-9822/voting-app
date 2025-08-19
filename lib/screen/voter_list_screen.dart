import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/home_screen.dart';
import 'package:flutter_vote/screen/profile_screen/profile_screen_i.dart';
import 'package:flutter_vote/screen/profile_screen/profile_screen_ii.dart';
import 'package:flutter_vote/screen/profile_screen/profile_screen_iii.dart';
import 'package:flutter_vote/screen/result_screen.dart';
import 'package:flutter_vote/widgets/custom_candidateinfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoterListScreen extends StatefulWidget {
  const VoterListScreen({super.key});

  @override
  State<VoterListScreen> createState() => _VoterListScreenState();
}

class _VoterListScreenState extends State<VoterListScreen> {
  @override
  void initState() {
    super.initState();
    _setInitialValueIfNotExists();
    _setInitialValueIfNot();
    _setInitialValueIf();
  }

  // Set initial value only once (e.g., 5)
  Future<void> _setInitialValueIfNotExists() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('counter')) {
      await prefs.setInt('counter', 350); // Set initial value in code
    }
  }

  // Set initial value only once (e.g., 5)
  Future<void> _setInitialValueIfNot() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('counte')) {
      await prefs.setInt('counte', 300); // Set initial value in code
    }
  }

  // Set initial value only once (e.g., 5)
  Future<void> _setInitialValueIf() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('count')) {
      await prefs.setInt('count', 250); // Set initial value in code
    }
  }

  Future<void> _incrementAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    int currentValue = prefs.getInt('counter') ?? 0;
    await prefs.setInt('counter', currentValue + 1);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen()),
    );
  }

  Future<void> _incrementAndNavig() async {
    final prefs = await SharedPreferences.getInstance();
    int currentValue = prefs.getInt('counte') ?? 0;
    await prefs.setInt('counte', currentValue + 1);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen()),
    );
  }

  Future<void> _incrementAnd() async {
    final prefs = await SharedPreferences.getInstance();
    int currentValue = prefs.getInt('count') ?? 0;
    await prefs.setInt('count', currentValue + 1);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen()),
    );
  }

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
            image: 'assets/images/avatar2.png',
            name: 'Siddheshwar Kamjalge',
            description:
                "Voting gives you the power to choose your own leader.",
            profileScreen: ProfileScreen1(),
            onVote: _incrementAndNavigate,
          ),
          SizedBox(height: screenWidth * 0.1),
          CandidateCard(
            image: 'assets/images/avatar1.png',
            name: 'Shekhar Tikhe',
            description:
                "I'm a candidate focused on equity and diversity embedded in education.",
            profileScreen: ProfileScreen2(),
            onVote: _incrementAndNavig,
          ),
          SizedBox(height: screenWidth * 0.1),
          CandidateCard(
            image: 'assets/images/avatar3.png',
            name: 'Satyam Wadje',
            description:
                "Let your voice be heard and work towards the fulfillment of your needs.",
            profileScreen: ProfileScreen3(),
            onVote: _incrementAnd,
          ),
        ],
      ),
    );
  }
}
