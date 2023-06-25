import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:text_app/data/word_data.dart';
import 'package:text_app/utils.dart';
import 'package:text_app/widgets/text_common.dart';
import 'package:text_app/widgets/text_item.dart';
import 'package:text_app/widgets/two_choices_button.dart';

import '../constants.dart';
import '../main.dart';
import 'package:enough_ascii_art/enough_ascii_art.dart' as art;

class ArtPage2 extends StatefulWidget {
  const ArtPage2({Key? key}) : super(key: key);

  @override
  State<ArtPage2> createState() => _RepeatPageState();
}

class _RepeatPageState extends State<ArtPage2> {
  late TextEditingController _textEditingController1;
  late TextEditingController _textEditingController2;
  List<Widget> items = [];

  String resultText = "";
  String? selectedValue;
  AdWidget? adWidget;
  bool showNative1 = false;

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
    final NativeAd myNative = NativeAd(
      adUnitId: NATIVE_ID,
      factoryId: 'adFactoryExample',
      request: const AdRequest(),
      listener: NativeAdListener(onAdLoaded: (Ad ad) {
        setState(() {
          showNative1 = true;
        });
      }),
    );
    adWidget = AdWidget(ad: myNative);
    showNative1 = false;
    myNative.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const TextCom("ASCII Text"),
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
                    List<Widget> newItems = [];
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.normal)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.serifBold)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.serifItalic)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.serifBoldItalic)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.sans)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.sansBold)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.sansItalic)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.sansBoldItalic)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.script)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.scriptBold)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.fraktur)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.frakturBold)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.monospace)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.fullwidth)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.doublestruck)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.capitalized)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.circled)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.parenthesized)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.underlinedSingle)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.underlinedDouble)));
                    newItems.add(makeTextItem(context, art.renderUnicode(text, art.UnicodeFont.strikethroughSingle)));
                    setState(() {
                      items = newItems;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: TextCom("Please enter the length and text")));
                  }
                },
              ),
            ),
          ),
          showNative1
              ? Container(
            alignment: Alignment.center,
            height: 310,
            width: 310,
            child: adWidget,
          )
              : Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: items,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
