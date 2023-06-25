import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:text_app/pages/art_page.dart';
import 'package:text_app/pages/art_page_2.dart';
import 'package:text_app/pages/art_page_3.dart';
import 'package:text_app/pages/repeat_page.dart';
import 'package:text_app/widgets/card_button.dart';
import 'package:text_app/widgets/text_common.dart';

import 'constants.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AdWidget? adWidget3;
  bool showAd3 = false;
  BannerAd? myBanner;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myBanner = BannerAd(
      adUnitId: BANNER_ID,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Dispose the ad here to free resources.
        ad.dispose();
        print('Ad failed to load: $error');
      }, onAdLoaded: (Ad ad) {
        setState(() {
          showAd3 = true;
        });
      }),
    );
    adWidget3 = AdWidget(ad: myBanner!);
    myBanner!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextCom("Text Art 1.0"),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: SizedBox(
        height: showAd3 ? myBanner!.size.height.toDouble() : 0,
        child: showAd3
            ? Container(
                alignment: Alignment.center,
                width: myBanner!.size.width.toDouble(),
                height: myBanner!.size.height.toDouble(),
                child: adWidget3,
              )
            : Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardButton(
              icon: Icons.repeat,
              text: 'Repeat Text',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RepeatPage()));
              },
            ),
            CardButton(
              icon: Icons.design_services_outlined,
              text: 'Word Art',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ArtPage()));
              },
            ),
            CardButton(
              icon: Icons.font_download_outlined,
              text: 'Ascii Art',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ArtPage2()));
              },
            ),
            CardButton(
              icon: Icons.image,
              text: 'Image Art',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ArtPage3()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
