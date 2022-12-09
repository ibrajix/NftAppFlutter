import 'package:flutter/material.dart';

abstract class Strings {
  static const nftMarketPlace = "Nft MarketPlace";
  static const collect = "Collect ";
  static const and = "and ";
  static const sell = "Sell ";
  static const digitalArts = "Digital Arts ";
  static const continueTxt = "Continue ";
  static const searchHere = "Search here";
  static const topItemClicked = "Top Pick Item Clicked ";
  static const trendingItemClicked = "Trending Item Clicked ";
  static const customErrorMessage  = "Something went terribly wrong";
  static const featured  = "Featured";
  static const topPick  = "Top Pick";
  static const trending  = "Trending";
  static const featuredItemClicked  = "Featured Item Clicked";
  static const featuredItemImage  = "https://i.ibb.co/P6L5xNg/nft8.jpg";
  static const featuredItemTitle  = "Pirates Man";
  static const viewAllClicked  = "View All Clicked";
  static const viewAll  = "View All";
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
  static const titleGrey = Color(0xFFCBCBCB);
}

abstract class EndPoints {
 static const _baseUrl = "https://622a3463be12fc4538b54792.mockapi.io/";
 static const topNft =  "${_baseUrl}top";
 static const trendingNft = "${_baseUrl}trending";
}