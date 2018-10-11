import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable()
class LanguageData {
  final int code;
  final List<Language> data;
  LanguageData({this.code, this.data});

  factory LanguageData.fromJson(Map<String, dynamic> json) =>
      _$LanguageDataFromJson(json);
}

@JsonSerializable()
class Language {
  final int id;
  final String lt; //languageType;

  Language({
    this.id,
    this.lt,
  });

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}
