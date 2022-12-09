import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_app_flutter/presentation/widgets/sliver_search_bar.dart';
import 'package:nft_app_flutter/presentation/widgets/top_pick.dart';
import 'package:nft_app_flutter/presentation/widgets/trending_items.dart';
import 'package:nft_app_flutter/state/bloc/api_state.dart';
import 'package:nft_app_flutter/state/bloc/nft_bloc.dart';
import '../model/TrendingNft.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NftBloc, ApiState>(
    listener: (context, state){
      if(state.isError){
        ScaffoldMessenger.of(context)
            .showSnackBar(
            SnackBar(
                content: Text(state.error ?? Strings.customErrorMessage),
                duration: const Duration(milliseconds: 300)
            )
        );
      }
    },
    builder: (context, state) {
    return Scaffold(
        backgroundColor: AppColors.mainBg,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverPersistentHeader(
                delegate: SliverSearchAppBar(),
              ),
              if(state.isLoading)
                const SliverToBoxAdapter(
                  child: Center(
                      child: CircularProgressIndicator()
                  ),
                ),
               SliverList(
                delegate: SliverChildListDelegate([
                  if(state.isSuccess)
                    _featured(),
                    _topPicks(),
                    _trending()
                ]),
              )
            ],
          ),
        )
       );
    },
  );
}

  _featured(){
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Text(
          Strings.featured,
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
           ),
          ),
          const SizedBox(height: 10),
         GestureDetector(
           onTap: () {
             ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
               content: Text(Strings.featuredItemClicked),
               duration: Duration(milliseconds: 200)
             ));
           },
           child: Stack(
             alignment: Alignment.center,
             children: [
               Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(Strings.featuredItemImage),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
               ),
               Positioned(
                 bottom: 0,
                 left: 0,
                 child: Padding(
                   padding: const EdgeInsets.all(20),
                   child: Text(
                     Strings.featuredItemTitle,
                     style: TextStyle(
                         background: Paint()
                           ..color = AppColors.titleGrey.withOpacity(0.4)
                           ..strokeWidth = 20
                           ..strokeJoin = StrokeJoin.round
                           ..strokeCap = StrokeCap.round
                           ..style = PaintingStyle.stroke,
                         color: Colors.white
                     ),
                   ),
                 ),
               )
           ]),
         )
        ]),
      );
  }

  _topPicks(){
    return Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Text(
                 Strings.topPick,
               style: TextStyle(
                   fontSize: 18,
                   color: Colors.white,
                   fontWeight: FontWeight.bold
               ),
             ),
             GestureDetector(
               onTap: () {
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                   content: Text(Strings.viewAllClicked),
                     duration: Duration(milliseconds: 200)
                 ));
               },
               child: const Text(
                   Strings.viewAll,
                 style: TextStyle(
                     fontSize: 14,
                     color: Colors.white,
                 ),
               ),
             )
            ],
          ),
          _topPickItems()
        ],
      ),
    );
  }

  _topPickItems(){
    return BlocBuilder<NftBloc, ApiState>(
    builder: (context, state) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: state.topNft.map<Widget>((data){
          return DisplayTopPick(data: data);
         }).toList()
        ),
      );
    },
   );
  }

  _trending(){
    return Container(
      padding: const EdgeInsets.only(top: 2, left: 20, right: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Strings.trending,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
            _trendingItems()
          ]
      ),
    );
  }

  _trendingItems(){
    return BlocBuilder<NftBloc, ApiState>(
    builder: (context, state) {
    final data = state.trendingNft;
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: state.trendingNft.length,
          itemBuilder: (context, index){
            return DisplayTrendingItems(data: data[index], index: index);
          }
      ),
    );
  },
);
  }

}

