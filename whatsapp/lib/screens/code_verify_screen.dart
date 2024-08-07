import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeVerifyScreen extends StatefulWidget {
  const CodeVerifyScreen({super.key});

  @override
  State<CodeVerifyScreen> createState() => _CodeVerifyScreenState();
}

class _CodeVerifyScreenState extends State<CodeVerifyScreen> {
  void _showConnectingPopUp() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 12),
              Text(
                "Connecting...",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verify your phone number code",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Text("Enter the 6-digit code we sent by phone call to"),
          Text(
            "+55 00 00000-0000",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 32),
            child: PinCodeTextField(
              appContext: context,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                inactiveColor: Colors.white,
                activeColor: Colors.teal[700],
              ),
              keyboardType: TextInputType.number,
              length: 6,
              onChanged: (value) {
                if (value.length == 6) {
                  _showConnectingPopUp();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
