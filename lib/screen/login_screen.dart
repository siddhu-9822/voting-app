import 'package:flutter/material.dart';

class SimpleLoginScreen extends StatefulWidget {
  const SimpleLoginScreen({super.key});

  @override
  State<SimpleLoginScreen> createState() => _SimpleLoginScreenState();
}

class _SimpleLoginScreenState extends State<SimpleLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Login Successful"),
        content: const Text("Welcome to the home screen."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 80),

            Container(
              alignment: const Alignment(0, 3),
              height: 160,
              width: 250,
              child: Image.asset('asset/images/vote_logo.png'),
            ),
            const Spacer(),
            TextField(
              controller: _emailController,

              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                filled: true,
                fillColor: const Color.fromARGB(46, 116, 116, 116),
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 34),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outlined),
                suffixIcon: const Icon(Icons.visibility),

                filled: true,
                fillColor: const Color.fromARGB(46, 116, 116, 116),
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 17),

            Text(
              "Forgot Password?",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 17,
                decoration: TextDecoration.underline,
                decorationColor:
                    Colors.blue, // Optional: change underline color
                decorationStyle: TextDecorationStyle
                    .solid, // Optional: change underline style (e.g., dotted, wavy)
                decorationThickness: 1,
              ),
            ),

            const SizedBox(height: 55),
            ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff8CA8F6),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Log In',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to Sign Up Screen
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.blue, fontSize: 17),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
