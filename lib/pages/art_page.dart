import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:text_app/data/word_data.dart';
import 'package:text_app/utils.dart';
import 'package:text_app/widgets/text_common.dart';
import 'package:text_app/widgets/two_choices_button.dart';

import '../constants.dart';
import '../main.dart';

class ArtPage extends StatefulWidget {
  const ArtPage({Key? key}) : super(key: key);

  @override
  State<ArtPage> createState() => _RepeatPageState();
}

class _RepeatPageState extends State<ArtPage> {
  late TextEditingController _textEditingController1;
  late TextEditingController _textEditingController2;

  String resultText = "";
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _textEditingController1 = TextEditingController(text: 'Hi');
    _textEditingController2 = TextEditingController(text: '');
    if (interstitialAd != null) {
      interstitialAd!.show();
      interstitialAd = null;
      InterstitialAd.load(
          adUnitId: INTERSTITIAL_ID,
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              // Keep a reference to the ad so you can show it later.
              interstitialAd = ad;
            },
            onAdFailedToLoad: (LoadAdError error) {
              debugPrint('InterstitialAd failed to load: $error');
            },
          ));
    } else {
      InterstitialAd.load(
          adUnitId: INTERSTITIAL_ID,
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              // Keep a reference to the ad so you can show it later.
              interstitialAd = ad;
            },
            onAdFailedToLoad: (LoadAdError error) {
              debugPrint('InterstitialAd failed to load: $error');
            },
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const TextCom("Art Text"),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Text(
            'Enter Text to make art:',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController1,
              onChanged: (text) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type here...',
              ),
            ),
          ),
          Text(
            'Enter any emoji or letter to make with:',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController2,
              onChanged: (text) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type here...',
              ),
            ),
          ),
          SizedBox(height: 8.0),
          // Container(
          //   height: 80,
          //   child: TwoChoicesButton(
          //     firstChoice: "Horizontal",
          //     secondChoice: "Vertical",
          //     onChanged: (data){
          //       setState(() {
          //         selectedValue = data;
          //       });
          //     },
          //   ),
          // ),
          SizedBox(height: 8.0),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextCom("Generate"),
                ),
                onPressed: () {
                  if (_textEditingController1.text.isNotEmpty) {
                    String re = "";
                    String text = _textEditingController1.text.toString();
                    text.characters.forEach((element) {
                      String eU = element.toUpperCase();
                      int aK = eU.codeUnitAt(0);
                      String emo = _textEditingController2.text.toString();
                      if(emo.isNotEmpty){
                        emo = emo.characters.first.toUpperCase();
                      }
                      if (aK >= 65 && aK <= 90) {
                        if(emo.isNotEmpty){
                          String val = alphabetPatterns[aK-65];
                          val = val.replaceAll(eU, emo);
                          re+=val;
                        }else{
                          re += design1[aK - 65];
                        }
                        if(selectedValue == "Horizontal"){
                          re += " ";
                        }else {
                          re += "\n";
                        }
                      }
                    });
                    setState(() {
                      resultText = re;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: TextCom("Please enter the length and text")));
                  }
                },
              ),
            ),
          ),
          Container(
            height: 300,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(resultText),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaterialButton(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextCom("Copy to clipboard"),
              ),
              onPressed: () {
                copyToClipboard(context, resultText);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: TextCom("Copied to clipboard.")));
              },
            ),
          ),
        ),
      ),
    );
  }
}
