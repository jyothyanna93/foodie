class LanguageData {
  final int code;
  final List<Language> data;
  LanguageData({this.code, this.data});

  factory LanguageData.fromjson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Language> languageList =
        list.map((i) => Language.fromjson(i)).toList();

//    print(orderList);

    return LanguageData(
      code: json['code'],
      data: languageList,
    );
  }
}

class Language {
  final int id;
  final String languageType;

  Language({
    this.id,
    this.languageType,
  });

  factory Language.fromjson(Map<String, dynamic> json) {
    return new Language(
      id: json['id'],
      languageType: json['lt'],
    );
  }
}
