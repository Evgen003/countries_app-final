import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final _favouritesBloc = getIt<FavouritesBloc>();

  bool _isFavourite = false;

  @override
  void initState() {
    _detailsBloc.stream.listen((state) {
      if (state is DetailsLoadSuccess) {
        _checkIfFavourite(state.details.wikiDataId);
      }
    });
    super.initState();
    _detailsBloc.add(const DetailsLoad());
  }

  void _toggleFavourite(Details article) {
    if (_isFavourite) {
      _favouritesBloc.add(FavouritesDelete(article.wikiDataId));
    } else {
      _favouritesBloc.add(FavouritesAdd(
        capital: article.capital,
        code: article.code,
        callingCode: article.callingCode,
        currencyCodes: article.currencyCodes,
        flagImageUri: article.flagImageUri,
        name: article.name,
        numRegions: article.numRegions,
        wikiDataId: article.wikiDataId,
      ));
    }
    setState(() {
      _isFavourite = !_isFavourite;
    });
  }

  Future<void> _checkIfFavourite(String id) async {
    final CollectionReference favorites =
        FirebaseFirestore.instance.collection('favorites');

    try {
      QuerySnapshot snapshot = await favorites
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favourites')
          .get();

      bool isFavourite = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList()
          .any((favorite) => favorite['wikiDataId'] == id);

      setState(() {
        _isFavourite = isFavourite;
      });
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подробности'),
        actions: [
          BlocBuilder<DetailsBloc, DetailsState>(
            bloc: _detailsBloc,
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  _isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavourite ? Colors.red : null,
                ),
                onPressed: () {
                  if (state is DetailsLoadSuccess) {
                    Details details = state.details;
                    _toggleFavourite(details);
                  }
                },
              );
            },
          ),
        ],
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
