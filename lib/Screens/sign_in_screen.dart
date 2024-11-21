import 'package:flutter/material.dart';
import 'otp_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController phoneController = TextEditingController();
  String? errorMessage;

  void validateAndNavigate() {
    String phoneNumber = phoneController.text.trim();

    if (phoneNumber.isEmpty) {
      setState(() {
        errorMessage = "Phone number cannot be empty.";
      });
    } else if (phoneNumber.length != 10 ||
        !RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      setState(() {
        errorMessage = "Enter a valid 10-digit phone number.";
      });
    } else {
      setState(() {
        errorMessage = null; 
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OTPScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Row(
              children: [
                Image.asset('assets/images/Group@2x.png', height: 60),
                const SizedBox(width: 12), 
                const Text(
                  "Balancers",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              "Welcome!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "We protect our community by high security systems from Google",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Text(
              "Phone Number",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Enter your phone number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue), // Blue background
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8),
                    ),
                  ),
                ),
                onPressed: validateAndNavigate,
                child: const Text(
                  "Send Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
