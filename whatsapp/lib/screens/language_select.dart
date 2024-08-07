import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSelect extends StatefulWidget {
  const LanguageSelect({super.key});

  @override
  State<LanguageSelect> createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  String value = "en";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            height: 240,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        colors: [
                          Colors.teal,
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );
                    },
                    child: Image.asset(
                      "assets/images/circle_bg.png",
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.welcomeToWhatsapp,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.toGetStartedChooseYourLanguage,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Radio(
                        value: "en", groupValue: value, onChanged: (_value) {}),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "English",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "English (United States)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      Radio(
                        value: "pt",
                        groupValue: value,
                        onChanged: (_value) {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Português (Brasil)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            "Not available",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
