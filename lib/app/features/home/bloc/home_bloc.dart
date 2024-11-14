import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/di/di.dart';
import 'package:countries_app/domain/domain.dart';
part "home_event.dart";
part "home_state.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GeoRepository geoRepository;
  HomeBloc(this.geoRepository) : super(HomeInitial()) {
    on<HomeLoad>(_homeLoad);
    on<HomeLoadAdd>(_homeLoadAdd);
    on<HomeLoadBack>(_homeLoadBack);
  }
  Future<void> _homeLoad(event, emit) async {
    try {
      if (state is! HomeLoadSuccess) {
        emit(HomeLoadInProgress());
      }
      final articles = await geoRepository.getCountries();
      emit(HomeLoadSuccess(
        articles: articles,
      ));
    } catch (exception, state) {
      emit(HomeLoadFailure(exception: exception));
      talker.handle(exception, state);
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _homeLoadAdd(event, emit) async {
    try {
      if (state is! HomeLoadSuccess) {
        emit(HomeLoadInProgress());
      }
      final articles = await geoRepository.getCountriesAdd(10);
      emit(HomeLoadSuccess(
        articles: articles,
      ));
    } catch (exception, state) {
      emit(HomeLoadFailure(exception: exception));
      talker.handle(exception, state);
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _homeLoadBack(event, emit) async {
    try {
      if (state is! HomeLoadSuccess) {
        emit(HomeLoadInProgress());
      }
      final articles = await geoRepository.getCountriesBack(10);
      emit(HomeLoadSuccess(
        articles: articles,
      ));
    } catch (exception, state) {
      emit(HomeLoadFailure(exception: exception));
      talker.handle(exception, state);
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    talker.handle(error, stackTrace);
  }
}
