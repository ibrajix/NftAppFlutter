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
                delegate: SliverChildListDelegate([
                  _featured(),
                  _topPicks(),
                  _trending()
                ]),
              )
            ],
          ),
        )
    );
  }

  _featured(){
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Text(
          "Featured",
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
           ),
          ),
          const SizedBox(height: 10),
         Stack(
           alignment: Alignment.center,
           children: [
             Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://i.ibb.co/P6L5xNg/nft8.jpg"),
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
                   "Pirates Man",
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
         ])
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
            children: const [
             Text(
                 "Top Pick",
               style: TextStyle(
                   fontSize: 18,
                   color: Colors.white,
                   fontWeight: FontWeight.bold
               ),
             ),
             Text(
                 "View All",
               style: TextStyle(
                   fontSize: 14,
                   color: Colors.white,
               ),
             )
            ],
          ),
          _topPickItems()
        ],
      ),
    );
  }

  _trending(){
    return Container(
      padding: const EdgeInsets.only(top: 2, left: 20, right: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Trending",
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

  _topPickItems(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          DisplayTopPick(),
          DisplayTopPick(),
          DisplayTopPick()
        ],
      ),
    );
  }

  _trendingItems(){
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index){
            return Row(
              children: const [
                Text("Hello")
              ],
            );
          }
      ),
    );
  }

}

class DisplayTopPick extends StatelessWidget {
  const DisplayTopPick({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 15),
      child: Column(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://i.ibb.co/P6L5xNg/nft8.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        ],
      ),
    );
  }

}

