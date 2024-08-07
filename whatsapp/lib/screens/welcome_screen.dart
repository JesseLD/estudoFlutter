import 'package:flutter/material.dart';
import 'package:whatsapp/screens/login_screen.dart';
import 'package:whatsapp/utils/custom_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 1,
              ),
              Container(
                width: 280,
                height: 280,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/circle_bg.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Column(
                  children: [
                    const Text(
                      "Welcome to Whatsapp",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "Read our ",
                        style: TextStyle(
                          color: CustomColors.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Privacy Policy.",
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text: " Tap AGREE AND CONTINUE' to accept the ",
                            style: TextStyle(color: CustomColors.gray),
                          ),
                          TextSpan(
                            text: "Terms of Service.",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.teal[700]),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "AGREE AND CONTINUE",
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
      ),
    );
  }
}
