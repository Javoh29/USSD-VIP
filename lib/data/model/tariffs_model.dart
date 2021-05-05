class TariffsModel {
  Title _title;
  List<Items> _items;

  Title get title => _title;
  List<Items> get items => _items;

  TariffsModel({
      Title title, 
      List<Items> items}){
    _title = title;
    _items = items;
}

  TariffsModel.fromJson(dynamic json) {
    _title = json["title"] != null ? Title.fromJson(json["title"]) : null;
    if (json["items"] != null) {
      _items = [];
      json["items"].forEach((v) {
        _items.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_title != null) {
      map["title"] = _title.toJson();
    }
    if (_items != null) {
      map["items"] = _items.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Items {
  Title _title;
  bool _code;
  int _price;
  int _minAll;
  int _net;
  int _sms;

  Title get title => _title;
  bool get code => _code;
  int get price => _price;
  int get minAll => _minAll;
  int get net => _net;
  int get sms => _sms;

  Items({
      Title title, 
      bool code, 
      int price, 
      int minAll, 
      int net, 
      int sms}){
    _title = title;
    _code = code;
    _price = price;
    _minAll = minAll;
    _net = net;
    _sms = sms;
}

  Items.fromJson(dynamic json) {
    _title = json["title"] != null ? Title.fromJson(json["title"]) : null;
    _code = json["code"];
    _price = json["price"];
    _minAll = json["minAll"];
    _net = json["net"];
    _sms = json["sms"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_title != null) {
      map["title"] = _title.toJson();
    }
    map["code"] = _code;
    map["price"] = _price;
    map["minAll"] = _minAll;
    map["net"] = _net;
    map["sms"] = _sms;
    return map;
  }

}

class Title {
  String _ru;
  String _uz;

  String get ru => _ru;
  String get uz => _uz;

  Title({
      String ru, 
      String uz}){
    _ru = ru;
    _uz = uz;
}

  Title.fromJson(dynamic json) {
    _ru = json["ru"];
    _uz = json["uz"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["ru"] = _ru;
    map["uz"] = _uz;
    return map;
  }

}