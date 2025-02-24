part of "favourites_bloc.dart";

sealed class FavouritesEvent extends Equatable {
  const FavouritesEvent();
  @override
  List<Object?> get props => [];
}

class FavouritesGet extends FavouritesEvent {}

class FavouritesAdd extends FavouritesEvent {
  final String capital;
  final String code;
  final String callingCode;
  final List currencyCodes;
  final String flagImageUri;
  final String name;
  final int numRegions;
  final String wikiDataId;

  const FavouritesAdd({
    required this.capital,
    required this.code,
    required this.callingCode,
    required this.currencyCodes,
    required this.flagImageUri,
    required this.name,
    required this.numRegions,
    required this.wikiDataId,
  });

  @override
  List<Object?> get props => [wikiDataId, capital, flagImageUri];
}

class FavouritesDelete extends FavouritesEvent {
  final String id;
  const FavouritesDelete(this.id);

  @override
  List<Object?> get props => [id];
}

class CheckFavoriteEvent extends FavouritesEvent {
  final String id;

  const CheckFavoriteEvent(this.id);
}
