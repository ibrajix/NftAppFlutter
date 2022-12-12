import 'package:flutter/material.dart';
import 'package:nft_app_flutter/utils/constants.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: const Text(
        Strings.noInternetConnection,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
    );
  }

}
