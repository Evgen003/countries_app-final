part of 'details.dart';

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      capital: json['capital'] as String,
      code: json['code'] as String,
      callingCode: json['callingCode'] as String,
      currencyCodes: (json['currencyCodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      flagImageUri: json['flagImageUri'] as String,
      name: json['name'] as String,
      numRegions: json['numRegions'] as int,
      wikiDataId: json['wikiDataId'] as String,
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'capital': instance.capital,
      'code': instance.code,
      'callingCode': instance.callingCode,
      'currencyCodes': instance.currencyCodes,
      'flagImageUri': instance.flagImageUri,
      'name': instance.name,
      'numRegions': instance.numRegions,
      'wikiDataId': instance.wikiDataId,
    };
