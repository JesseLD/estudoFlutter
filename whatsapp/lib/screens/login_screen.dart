import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp/screens/code_verify_screen.dart';
import 'package:whatsapp/utils/custom_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String countryCode = "BR";

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

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
      _showConfirmationNumber();
    });
  }

  void _showConfirmationNumber() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "The number it's correct?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "+55 00000-0000",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Edit",
                style: TextStyle(
                  color: Colors.teal[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                // _showConnectingPopUp();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CodeVerifyScreen()));
              },
              child: Text(
                "Yes",
                style: TextStyle(
                  color: Colors.teal[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Insert your phone number",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "The whatsapp needs verify your account.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 280,
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      items: [
                        DropdownMenuItem(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Brazil"),
                            ),
                            value: "BR"),
                        DropdownMenuItem(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("United States"),
                            ),
                            value: "US"),
                        DropdownMenuItem(
                            alignment: Alignment.center,
                            child: Container(
                              child: Text("Argentina"),
                            ),
                            value: "AR"),
                      ],
                      onChanged: (item) {
                        setState(() {
                          countryCode = item!;
                        });
                      },
                      value: countryCode,
                      alignment: Alignment.topRight,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 280,
              child: Form(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "000",
                            prefix: Text(
                              "+  ",
                              style: TextStyle(color: CustomColors.gray),
                            ),
                            counterText: ""),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Phone",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.teal[700]),
                  ),
                  onPressed: () {
                    _showConnectingPopUp();
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.darkGreen,
                    ),
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
