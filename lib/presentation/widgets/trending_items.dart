import 'package:flutter/material.dart';
import 'package:nft_app_flutter/model/TrendingNft.dart';

class DisplayTrendingItems extends StatelessWidget {

  const DisplayTrendingItems({this.data, this.index,  Key? key}) : super(key: key);

  final TrendingNft? data;
  final int? index;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Trending Item Clicked"),
            duration: Duration(milliseconds: 200)
        ));
      },
      child: Padding(
        padding: index == - 1
            ? const EdgeInsets.fromLTRB(8, 0, 8, 0)
            : const EdgeInsets.only(bottom: 20),
        child: Row(
          children:[
            Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(data?.image ?? "")
                    )
                )),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?.name ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data?.category ?? "",
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
