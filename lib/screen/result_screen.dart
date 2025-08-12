import 'package:flutter/material.dart';
import 'package:flutter_vote/widgets/custom_button.dart';
import 'package:flutter_vote/widgets/result_list.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Result of Election",

            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ResultList(
              imagePath: 'asset/images/avatar2.png',
              name: 'Siddheshwar Kamjalge',
              progressValue: 0.42,
              currentScore: 420,
              maxScore: 1000,
            ),
            SizedBox(height: 30),
            ResultList(
              imagePath: 'asset/images/avatar2.png',
              name: 'Satyam Wadje',
              progressValue: 0.3,
              currentScore: 300,
              maxScore: 1000,
            ),
            SizedBox(height: 30),
            ResultList(
              imagePath: 'asset/images/avatar2.png',
              name: 'Siddheshwar Kamjalge',
              progressValue: 0.25,
              currentScore: 250,
              maxScore: 1000,
            ),
            SizedBox(height: 250),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
              child: CustomButton(text: "Home", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
