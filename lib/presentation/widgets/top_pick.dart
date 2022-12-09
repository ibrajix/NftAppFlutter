import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_app_flutter/model/TopNft.dart';
import 'package:nft_app_flutter/state/bloc/api_state.dart';
import 'package:nft_app_flutter/state/bloc/nft_bloc.dart';

import '../../utils/constants.dart';

class DisplayTopPick extends StatelessWidget {

  const DisplayTopPick({this.data, super.key});

  final TopNft? data;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 20, right: 15),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: Text("${Strings.topItemClicked} ${data?.id}"),
            duration: const Duration(milliseconds: 200),
          ));
        },
        child: Column(
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data?.image ?? ""),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
            )
          ],
        ),
      ),
    );
  }
}