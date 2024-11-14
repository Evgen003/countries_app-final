import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  Article({
    required this.code,
    required this.currencyCodes,
    required this.name,
    required this.wikiDataId,
  });

  @JsonKey(name: '_id')
  final String code;
  final String name;
  final List<String> currencyCodes;
  final String wikiDataId;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
