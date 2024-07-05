import 'package:flutter/material.dart';
import 'package:chatting_app/views/screen/auth/register.dart';

class EnterCodeScreen extends StatefulWidget {
  final String verificationCode;
  final String phoneNumber;

  const EnterCodeScreen({
    Key? key,
    required this.verificationCode,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _EnterCodeScreenState createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final TextEditingController _codeController = TextEditingController();

  void _verifyCode() {
    String enteredCode = _codeController.text.trim();
    String verificationCode = widget.verificationCode;

    if (enteredCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter the verification code")),
      );
      return;
    }

    if (enteredCode == verificationCode) {
      // Code verification successful, navigate to the next screen (Register screen)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Register(phoneNumber: widget.phoneNumber),
        ),
      );
    } else {
      // Incorrect code entered
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Verification code incorrect")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Verification Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter the code sent to your phone number',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _codeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff2A3C54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff152033)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff152033)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter the code',
                  hintStyle: const TextStyle(color: Colors.white54),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(327, 52),
              ),
              onPressed: _verifyCode,
              child: const Text(
                'Verify',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
