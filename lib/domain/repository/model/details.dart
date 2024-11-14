import 'package:json_annotation/json_annotation.dart';
part 'details.g.dart';

@JsonSerializable()
class Details {
  Details({
    required this.capital,
    required this.code,
    required this.callingCode,
    required this.currencyCodes,
    required this.flagImageUri,
    required this.name,
    required this.numRegions,
    required this.wikiDataId,
  });
  @JsonKey(name: '_id')
  final String capital;
  final String code;
  final String callingCode;
  final List currencyCodes;
  final String flagImageUri;
  final String name;
  final int numRegions;
  final String wikiDataId;
  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
