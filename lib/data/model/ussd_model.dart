class UssdModel {
  Title _title;
  List<Items> _items;

  Title get title => _title;
  List<Items> get items => _items;

  UssdModel({
      Title title, 
      List<Items> items}){
    _title = title;
    _items = items;
}

  UssdModel.fromJson(dynamic json) {
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
  Desc _desc;
  String _code;

  Title get title => _title;
  Desc get desc => _desc;
  String get code => _code;

  Items({
      Title title, 
      Desc desc, 
      String code}){
    _title = title;
    _desc = desc;
    _code = code;
}

  Items.fromJson(dynamic json) {
    _title = json["title"] != null ? Title.fromJson(json["title"]) : null;
    _desc = json["desc"] != null ? Desc.fromJson(json["desc"]) : null;
    _code = json["code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_title != null) {
      map["title"] = _title.toJson();
    }
    if (_desc != null) {
      map["desc"] = _desc.toJson();
    }
    map["code"] = _code;
    return map;
  }

}

/// ru : "Проверка баланса на вашем счету."
/// uz : "Xisobingizdagi mablag'ni tekshiring."

class Desc {
  String _ru;
  String _uz;

  String get ru => _ru;
  String get uz => _uz;

  Desc({
      String ru, 
      String uz}){
    _ru = ru;
    _uz = uz;
}

  Desc.fromJson(dynamic json) {
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

/// ru : "Проверка баланса"
/// uz : "Balans tekshirish"

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