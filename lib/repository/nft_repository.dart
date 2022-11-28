import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nft_app_flutter/api/api_base_helper.dart';
import 'package:nft_app_flutter/model/TopNft.dart';
import 'package:nft_app_flutter/utils/constants.dart';

class NftRepository{

  final ApiBaseHelper _helper = ApiBaseHelper();
    getTopNft() async {
     final response = await _helper.get(Uri.parse(EndPoints.topNft));
     List<TopNft> topNftList = List<TopNft>.from(response.map((i) => TopNft.fromJson(i)));
     return topNftList;
  }

}