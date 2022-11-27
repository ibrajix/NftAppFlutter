import 'package:flutter/material.dart';

abstract class Strings {
  static const nftMarketPlace = "Nft MarketPlace";
  static const collect = "Collect ";
  static const and = "and ";
  static const sell = "Sell ";
  static const digitalArts = "Digital Arts ";
  static const continueTxt = "Continue ";
}

abstract class Images {
  static const splashImage = "assets/images/monkey.png";
  static const lineImage = "assets/images/line.png";
  static const engImage = "assets/images/eng.png";
}

abstract class Destination {
  static const splashScreen = '/';
  static const welcomeScreen = '/welcome';
  static const homeScreen = '/home';
}

abstract class AppColors {
  static const mainBg = Color(0xFF023047);
  static const mainYellow = Color(0xFFFFB703);
}

abstract class EndPoints {
 static const _baseUrl = "https://622a3463be12fc4538b54792.mockapi.io/";
 static const topNft =  "${_baseUrl}top";
 static const trendingNft = "${_baseUrl}trending";
}