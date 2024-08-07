// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:whatsapp/utils/custom_colors.dart';

class LanguageSelect extends StatefulWidget {
  final Function(Locale) setLocale;

  const LanguageSelect({
    super.key,
    required this.setLocale,
  });

  @override
  State<LanguageSelect> createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  String value = "en";

  void _handleRadioValueChange(String? value) {
    setState(() {
      this.value = value!;
      widget.setLocale(Locale(value));
    });
  }

  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString('lang') ?? 'en';

    setState(() {
      value = localeCode;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadLocale();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            width: width,
            height: 280,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/circle_bg.png",
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              "${AppLocalizations.of(context)!.welcomeToWhatsapp}",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 32, height: 1.2),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            AppLocalizations.of(context)!.toGetStartedChooseYourLanguage,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: CustomColors.gray),
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
                        value: "en",
                        groupValue: value,
                        onChanged: _handleRadioValueChange),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.englishLang,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          AppLocalizations.of(context)!.englishLocale,
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
                          onChanged: _handleRadioValueChange),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.portugueseLang,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            AppLocalizations.of(context)!.portugueseLocale,
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.teal[700]),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/welcome_screen");
                },
                child: Text(
                  AppLocalizations.of(context)!.next,
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
    );
  }
}
