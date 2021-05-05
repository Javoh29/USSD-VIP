class InternetModel {
  Title _title;
  List<Items> _items;

  Title get title => _title;

  List<Items> get items => _items;

  InternetModel({Title title, List<Items> items}) {
    _title = title;
    _items = items;
  }

  InternetModel.fromJson(dynamic json) {
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
  String _code;
  int _period;
  int _price;

  Title get title => _title;

  String get code => _code;

  int get period => _period;

  int get price => _price;

  Items({Title title, String code, int period, int price}) {
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

class Title {
  String _ru;
  String _uz;

  String get ru => _ru;

  String get uz => _uz;

  Title({String ru, String uz}) {
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
