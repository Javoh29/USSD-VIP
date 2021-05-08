class BannerModel {
  String _imgUrl;
  String _link;

  String get imgUrl => _imgUrl;
  String get link => _link;

  BannerModel({
      String imgUrl, 
      String link}){
    _imgUrl = imgUrl;
    _link = link;
}

  BannerModel.fromJson(dynamic json) {
    _imgUrl = json["imgUrl"];
    _link = json["link"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["imgUrl"] = _imgUrl;
    map["link"] = _link;
    return map;
  }

}