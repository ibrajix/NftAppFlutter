import 'package:flutter/cupertino.dart';
import 'package:nft_app_flutter/presentation/widgets/search_bar.dart';

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {

  const SliverSearchAppBar();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SearchBar(),
        )
      ],
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;

}