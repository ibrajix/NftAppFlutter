class TrendingNft {
  TrendingNft({
       this.image,
       this.name,
       this.category,
       this.id});

  TrendingNft.fromJson(dynamic json) {
    image = json['image'];
    name = json['name'];
    category = json['category'];
    id = json['id'];
  }

  String? image;
  String? name;
  String? category;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    map['category'] = category;
    map['id'] = id;
    return map;
  }

}