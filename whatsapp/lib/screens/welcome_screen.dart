import 'package:flutter/material.dart';
import 'package:whatsapp/utils/custom_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Text(
                        AppLocalizations.of(context)!.welcomeToWhatsapp,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          height: 1.2,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "${AppLocalizations.of(context)!.readOur} ",
                        style: TextStyle(
                          color: CustomColors.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text:
                                AppLocalizations.of(context)!.privacyPolicyDOT,
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text:
                                " ${AppLocalizations.of(context)!.tapAgreeAndContinueToAcceptThe} ",
                            style: TextStyle(color: CustomColors.gray),
                          ),
                          TextSpan(
                            text:
                                AppLocalizations.of(context)!.termsOfServiceDOT,
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
                      Navigator.pushNamed(context, "/login_screen");
                    },
                    child: Text(
                      AppLocalizations.of(context)!.aGREE_AND_CONTINUE,
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
