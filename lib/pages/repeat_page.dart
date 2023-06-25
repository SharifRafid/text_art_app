import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:text_app/utils.dart';
import 'package:text_app/widgets/text_common.dart';

import '../constants.dart';
import '../main.dart';

class RepeatPage extends StatefulWidget {
  const RepeatPage({Key? key}) : super(key: key);

  @override
  State<RepeatPage> createState() => _RepeatPageState();
}

class _RepeatPageState extends State<RepeatPage> {
  late TextEditingController _textEditingController1;
  late TextEditingController _textEditingController2;

  String resultText = "";

  @override
  void initState() {
    super.initState();
    _textEditingController1 = TextEditingController(text: 'Hi');
    _textEditingController2 = TextEditingController(text: '100');
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
        title: const TextCom("Repeat Text"),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Text(
            'Enter Text to repeat:',
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
          SizedBox(height: 8.0),
          Text(
            'Enter how many times to repeat:',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController2,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (text) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type here...',
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextCom("Generate"),
                ),
                onPressed: (){
                  if(
                  _textEditingController1.text.isNotEmpty && _textEditingController2.text.isNotEmpty
                  ){
                    String re = "";
                    int i = 0;
                    int max = int.parse(_textEditingController2.text.toString());
                    while(i < max){
                      re += _textEditingController1.text.toString();
                      re += "\n";
                      i += 1;
                    }
                    setState(() {
                      resultText = re;
                    });
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                    TextCom("Please enter the length and text")));
                  }
                },
              ),
            ),
          ),
          Container(
            height: 300,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                resultText
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        child:
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaterialButton(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextCom("Copy to clipboard"),
              ),
              onPressed: (){
                copyToClipboard(context, resultText);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                TextCom("Copied to clipboard.")));
              },
            ),
          ),
        ),
      ),
    );
  }
}
