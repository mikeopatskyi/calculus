import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdPopup extends StatefulWidget {
  const AdPopup({Key? key}) : super(key: key);

  @override
  State<AdPopup> createState() => _AdPopupState();
}

class _AdPopupState extends State<AdPopup> {
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  late Timer _adTimer;

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();

    const adInterval = Duration(minutes: 2);
    _adTimer = Timer.periodic(adInterval, (Timer timer) {
      _showInterstitialAd();
    });
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    _adTimer.cancel();
    super.dispose();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _interstitialAd = ad;
            _isAdLoaded = true;
          });

          _interstitialAd?.fullScreenContentCallback =
              FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
            _loadInterstitialAd();
          });
        },
        onAdFailedToLoad: (error) {
          print('Interstitial Ad failed to load: $error');
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_isAdLoaded) {
      _interstitialAd?.show();
    } else {
      print('Interstitial Ad not loaded yet.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
