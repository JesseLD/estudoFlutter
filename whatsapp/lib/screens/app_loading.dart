import 'package:flutter/material.dart';
import 'package:whatsapp/utils/custom_colors.dart';

class AppLoading extends StatefulWidget {
  const AppLoading({super.key});

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHomeScreen();
  }

  _navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) {
      // Navigator.pushNamedAndRemoveUntil(context, "/welcome_screen");
      Navigator.pushNamedAndRemoveUntil(
          context, "/language_select", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 2,
            ),
            Image(
              width: 72,
              image: AssetImage(
                "assets/images/logo_white.png",
              ),
            ),
            Column(
              children: [
                Text(
                  "from",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColors.gray,
                  ),
                ),
                Text(
                  "JesseLD",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
