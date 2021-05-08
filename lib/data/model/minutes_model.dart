/// title : {"ru":"Месяц","uz":"Oy"}
/// items : [{"title":{"ru":"60 мин","uz":"60 daq"},"code":"*171*103*60*1*010100180*1#","period":30,"price":4000},{"title":{"ru":"120 мин","uz":"120 daq"},"code":"*171*103*120*1*010100180*1#","period":30,"price":7000},{"title":{"ru":"180 мин","uz":"180 daq"},"code":"*171*103*180*1*010100180*1#","period":30,"price":10000},{"title":{"ru":"300 мин","uz":"300 daq"},"code":"*171*103*300*1*010100180*1#","period":30,"price":16000},{"title":{"ru":"900 мин","uz":"900 daq"},"code":"*171*103*900*1*010100180*1#","period":30,"price":37000},{"title":{"ru":"1200 мин","uz":"1200 daq"},"code":"*171*103*1200*1*010100180*1#","period":30,"price":45000},{"title":{"ru":"1800 мин","uz":"1800 daq"},"code":"*171*103*1800*1*010100180*1#","period":30,"price":62000}]

class MinutesModel {
  Title _title;
  List<Items> _items;

  Title get title => _title;
  List<Items> get items => _items;

  MinutesModel({
      Title title, 
      List<Items> items}){
    _title = title;
    _items = items;
}

  MinutesModel.fromJson(dynamic json) {
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

/// title : {"ru":"60 мин","uz":"60 daq"}
/// code : "*171*103*60*1*010100180*1#"
/// period : 30
/// price : 4000

class Items {
  Title _title;
  String _code;
  var _period;
  int _price;

  Title get title => _title;
  String get code => _code;
  get period => _period;
  int get price => _price;

  Items({
      Title title, 
      String code, 
      var period,
      int price}){
    _title = title;
    _code = code;
    _period = period;
    _price = price;
}

  Items.fromJson(dynamic json) {
    _title = json["title"] != null ? Title.fromJson(json["title"]) : null;
    _code = json["code"];
    _period = json["period"];
    _price = json["price"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_title != null) {
      map["title"] = _title.toJson();
    }
    map["code"] = _code;
    map["period"] = _period;
    map["price"] = _price;
    return map;
  }

}

/// ru : "60 мин"
/// uz : "60 daq"

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