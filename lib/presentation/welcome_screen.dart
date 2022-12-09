import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nft_app_flutter/utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.mainBg,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              Strings.nftMarketPlace,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Image.asset(
              Images.lineImage,
            ),
            const SizedBox(height: 80),
            Image.asset(
              Images.engImage,
              scale: 1.2,
            ),
            const SizedBox(height: 80),
            const Text.rich(
                 TextSpan(
                   children: [
                     TextSpan(
                       text: Strings.collect,
                       style: TextStyle(
                           fontSize: 25,
                           color: AppColors.mainYellow
                       ),
                     ),
                     TextSpan(
                       text: Strings.and,
                       style: TextStyle(
                           fontSize: 25,
                           color: Colors.white
                       ),
                     ),
                     TextSpan(
                       text: Strings.sell,
                       style: TextStyle(
                           fontSize: 25,
                           color: AppColors.mainYellow
                       ),
                     ),
                   ],
                ),
            ),
            const SizedBox(height: 10),
            const Text(
              Strings.digitalArts,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
                onPressed: () {
                  context.go(Destination.homeScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainYellow,
                  minimumSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: const Text(
                  Strings.continueTxt,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}
