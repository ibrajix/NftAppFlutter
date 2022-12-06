import 'package:flutter/material.dart';
import 'package:nft_app_flutter/presentation/widgets/sliver_search_bar.dart';


import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBg,
      body: SafeArea(

        child: CustomScrollView(
          slivers: [
            const SliverPersistentHeader(
              delegate: SliverSearchAppBar(),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(16),
                        child: const Text(
                          "Hello"
                        ),
                      );
                    }
                )
            )
          ],
         ),
      )
      );
  }

}
