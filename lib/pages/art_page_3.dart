import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_app/data/word_data.dart';
import 'package:text_app/utils.dart';
import 'package:text_app/widgets/text_common.dart';
import 'package:text_app/widgets/text_item.dart';
import 'package:text_app/widgets/two_choices_button.dart';

import '../constants.dart';
import '../main.dart';
import 'package:enough_ascii_art/enough_ascii_art.dart' as art;
import 'dart:io';
import 'package:image/image.dart' as img;

class ArtPage3 extends StatefulWidget {
  const ArtPage3({Key? key}) : super(key: key);

  @override
  State<ArtPage3> createState() => _RepeatPageState();
}

class _RepeatPageState extends State<ArtPage3> {
  late TextEditingController _textEditingController1;
  late TextEditingController _textEditingController2;
  List<Widget> items = [];
  double _value = 20; // Initial value
  XFile? image;
  String resultText = "";
  String? selectedValue;
  bool showReload = false;

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
        title: const TextCom("Image Text"),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Container(height: 20,),
          Text(
            'Maximum Line Size',
            style: TextStyle(fontSize: 16.0),
          ),
          Slider(
            value: _value,
            min: 10,
            max: 50,
            divisions: 40, // Number of divisions between min and max (excluding min and max)
            onChanged: (newValue) {
              setState(() {
                _value = newValue;
                showReload = true;
              });
            },
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextCom("Select Image"),
                    ),
                    onPressed: () async {
                      image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      processImage();
                    },
                  ),
                ),
                showReload? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextCom("Refresh"),
                    ),
                    onPressed: () async {
                       processImage();
                    },
                  ),
                ):Container(),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(resultText, style: TextStyle(
                  fontSize: 12
                ),),
              ),
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

  void processImage() async {
    if (image != null) {
      final bytes = await File(image!.path).readAsBytes();
      final item = img.decodeImage(bytes);
      if(item!=null){
        String re = art.convertImage(item, maxWidth: _value.toInt(), invert: true);
        setState(() {
          resultText = re;
          showReload = false;
        });
      }
    }
  }
}
