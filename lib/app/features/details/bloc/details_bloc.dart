import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/di/di.dart';
import 'package:countries_app/domain/domain.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final CountryDetailsRepository detailsRepository;
  DetailsBloc(this.detailsRepository) : super(DetailsInitial()) {
    on<DetailsLoad>(_detailsLoad);
  }
  Future<void> _detailsLoad(event, emit) async {
    try {
      if (state is! DetailsLoadSuccess) {
        emit(DetailsLoadInProgress());
      }
      final details = await detailsRepository.getCountryDetails();
      emit(DetailsLoadSuccess(
        details: details,
      ));
    } catch (exception, state) {
      emit(DetailsLoadFailure(exception: exception));
      talker.handle(exception, state);
    } finally {
      event.completer?.complete();
    }
  }
}
