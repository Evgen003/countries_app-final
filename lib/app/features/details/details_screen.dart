import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/app/app.dart';
import 'package:countries_app/di/di.dart';
import 'package:countries_app/domain/domain.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _detailsBloc = DetailsBloc(getIt<CountryDetailsRepository>());
  @override
  void initState() {
    _detailsBloc.add(const DetailsLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подробности'),
      ),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        bloc: _detailsBloc,
        builder: (context, state) {
          if (state is DetailsLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DetailsLoadSuccess) {
            Details details = state.details;
            var name = details.name;
            var capital = details.capital;
            var callingCode = details.callingCode;
            var numRegions = details.numRegions.toString();
            return Column(
              children: [
                SvgPicture.network(
                  details.flagImageUri,
                  height: 100,
                ),
                //Image.network(details.flagImageUri),
                Text(
                  name,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text('Столица: $capital',
                    style: Theme.of(context).textTheme.displayMedium),
                Text(
                  'Телефонный код: $callingCode',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  'Число регионов: $numRegions',
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            );
          }
          if (state is DetailsLoadFailure) {
            return ErrorCard(
              title: 'Ошибка',
              description: state.exception.toString(),
              onReload: () {
                _detailsBloc.add(const DetailsLoad());
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
