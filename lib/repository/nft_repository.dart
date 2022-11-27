import 'dart:convert';

import 'package:nft_app_flutter/api/api_base_helper.dart';
import 'package:nft_app_flutter/model/TopNft.dart';
import 'package:nft_app_flutter/utils/constants.dart';

class NftRepository{

  final ApiBaseHelper _helper = ApiBaseHelper();
    getTopNft() async {
     final response = await _helper.get(Uri.parse(EndPoints.topNft));
     return TopNft.fromJson(response);
  }

}