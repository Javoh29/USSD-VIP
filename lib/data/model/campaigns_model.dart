/// title : {"ru":"Акции","uz":"Aktsiyalar"}
/// items : [{"title":{"ru":"«Счастливые миллионы с Mobiuz»","uz":"«Mobiuz bilan baxtli millionlar» aksiyasi"},"desc":{"ru":"Абонент - пользователь тарифов для физических лиц c предоплатной системой расчетов (кроме тарифов для туристов), купивший пакет «5555 MB».","uz":"Abonent - «5555 MB» to‘plamini xarid qilgan, jismoniy shaxslar uchun mo‘ljallangan (turistlar uchun mo‘ljallangan tariflardan tashqari) oldindan to‘lov qilish hisob-kitob tizimli tarif rejalarining foydalanuvchisi."}},{"title":{"ru":"Акция «MEGAбайты + 25%»","uz":"«MEGAbaytlar +25%» aksiyasi"},"desc":{"ru":"При покупки месячных интернет пакетов получите 25% от купленного объема трафика в подарок.Акция «MEGAбайты +25%» действует до 06.09.2020 г.","uz":"Oylik internet to'plamlar oling va qo'shimcha 25% MBlarga ega bo'ling.«MEGAbaytlar +25%» aksiyasi 06.09.2020gacha amal qiladi."}},{"title":{"ru":"Акция «АвтоMOBI»","uz":"«АвтоMOBI» aksiyasi"},"desc":{"ru":"Подключитесь на тарифный план с абонентской платой 30 000 сум/мес. и больше, и участвуйте в акции «АвтоMOBI»!Также в акции участвуют абоненты – физические лица всех тарифных планов (кроме ТП «Tourist SIM», «Tourist SIM Lite», «Tourist SIM+», «Tourist SIM Lite+»), купившие пакет «2020 MB» или «2020 минут»!","uz":"Oylik abonent to‘lovi 30 000 so‘m va undan ko‘proq bo‘lgan tarif rejalariga ulaning hamda «АвтоMOBI» aksiyasi ishtirokchisiga aylaning!Shuningdek, aksiyada «2020 MB» yoki «2020 daqiqa» maxsus to‘plamlarini faollashtirgan abonentlar – jismoniy shaxslar («Tourist SIM», «Tourist SIM Lite», «Tourist SIM+», «Tourist SIM Lite+» TR foydalanuvchilaridan tashqari) ham ishtirok etishi mumkin!"}}]

class CampaignsModel {
  Title _title;
  List<Items> _items;

  Title get title => _title;
  List<Items> get items => _items;

  CampaignsModel({
      Title title, 
      List<Items> items}){
    _title = title;
    _items = items;
}

  CampaignsModel.fromJson(dynamic json) {
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

/// title : {"ru":"«Счастливые миллионы с Mobiuz»","uz":"«Mobiuz bilan baxtli millionlar» aksiyasi"}
/// desc : {"ru":"Абонент - пользователь тарифов для физических лиц c предоплатной системой расчетов (кроме тарифов для туристов), купивший пакет «5555 MB».","uz":"Abonent - «5555 MB» to‘plamini xarid qilgan, jismoniy shaxslar uchun mo‘ljallangan (turistlar uchun mo‘ljallangan tariflardan tashqari) oldindan to‘lov qilish hisob-kitob tizimli tarif rejalarining foydalanuvchisi."}

class Items {
  Title _title;
  Desc _desc;

  Title get title => _title;
  Desc get desc => _desc;

  Items({
      Title title, 
      Desc desc}){
    _title = title;
    _desc = desc;
}

  Items.fromJson(dynamic json) {
    _title = json["title"] != null ? Title.fromJson(json["title"]) : null;
    _desc = json["desc"] != null ? Desc.fromJson(json["desc"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_title != null) {
      map["title"] = _title.toJson();
    }
    if (_desc != null) {
      map["desc"] = _desc.toJson();
    }
    return map;
  }

}

/// ru : "Абонент - пользователь тарифов для физических лиц c предоплатной системой расчетов (кроме тарифов для туристов), купивший пакет «5555 MB»."
/// uz : "Abonent - «5555 MB» to‘plamini xarid qilgan, jismoniy shaxslar uchun mo‘ljallangan (turistlar uchun mo‘ljallangan tariflardan tashqari) oldindan to‘lov qilish hisob-kitob tizimli tarif rejalarining foydalanuvchisi."

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

/// ru : "«Счастливые миллионы с Mobiuz»"
/// uz : "«Mobiuz bilan baxtli millionlar» aksiyasi"

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