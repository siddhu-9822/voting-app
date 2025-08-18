import 'package:flutter/material.dart';
import 'package:flutter_vote/screen/login_screen.dart';
import 'package:flutter_vote/screen/voter_list_screen.dart';
import 'package:flutter_vote/widgets/custom_button.dart';
import 'package:flutter_vote/widgets/custom_voteInfocard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _accountIconKey = GlobalKey();
  OverlayEntry? _accountOverlay;

  void _showAccountDropdown(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? 'User';

    // Avoid stacking multiple overlays
    if (_accountOverlay != null) {
      _accountOverlay!.remove();
      _accountOverlay = null;
      return;
    }

    final RenderBox renderBox =
        _accountIconKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _accountOverlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Tap outside to dismiss
          GestureDetector(
            onTap: () {
              _accountOverlay?.remove();
              _accountOverlay = null;
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              color: Colors.transparent, // full screen area
            ),
          ),

          // Dropdown box positioned under account icon
          Positioned(
            top: offset.dy + size.height + 8,
            right: 16,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 220,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // const Text(
                    //   'Hi 👋',
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    const SizedBox(height: 8),

                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/avatar2.png'),
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(height: 12),

                    Text(
                      "username : \n "
                      "  $username",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      icon: Icon(Icons.logout, size: 18, color: Colors.black),
                      label: Text(
                        'Logout',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          184,
                          91,
                          129,
                          254,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      onPressed: () async {
                        await prefs.setBool('isFirstLoginComplete', false);
                        await prefs.setBool('loggedIn', false);
                        await prefs.remove('username');

                        _accountOverlay?.remove();
                        _accountOverlay = null;

                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SimpleLoginScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_accountOverlay!);
  }

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
          GestureDetector(
            key: _accountIconKey,
            onTap: () => _showAccountDropdown(context),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
                size: screenWidth * 0.09,
              ),
            ),
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
