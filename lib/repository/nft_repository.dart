import 'package:nft_app_flutter/api/api_base_helper.dart';
import 'package:nft_app_flutter/utils/constants.dart';

class NftRepository{

  final ApiBaseHelper _helper = ApiBaseHelper();

  getAllNft() async {
     final response = await Future.wait(
       [
         _helper.get(Uri.parse(EndPoints.topNft)),
         _helper.get(Uri.parse(EndPoints.trendingNft))
       ]
     );
     return response;
  }

}