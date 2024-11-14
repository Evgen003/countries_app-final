// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      code: json['code'] as String,
      currencyCodes: (json['currencyCodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String,
      wikiDataId: json['wikiDataId'] as String,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'code': instance.code,
      'currencyCode': instance.currencyCodes,
      'name': instance.name,
      'wikiDataId': instance.wikiDataId,
    };
