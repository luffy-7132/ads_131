import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? myBannerAd;

  @override
  void initState() {
    super.initState();
    /*"ca-app-pub-1422941307491131/1421515037"*/

    myBannerAd = BannerAd(
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        request: AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          onAdClicked: (ad) {

          },
          onAdClosed: (ad) {

          },
          onAdLoaded: (ad) {
            print('Ad Loaded!!');
          },
          onAdImpression: (ad) {

          },
          onAdFailedToLoad: (ad, error) {
            print("Loading Ad Failed!! ${error.message}");
          },
        )
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Container(
        child: myBannerAd != null ? Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: myBannerAd!.size.width.toDouble(),
              height: myBannerAd!.size.height.toDouble(),
              child: AdWidget(
                  ad: myBannerAd!
              ),
            )
        ) : Container(),
      ),
    );
  }
}

