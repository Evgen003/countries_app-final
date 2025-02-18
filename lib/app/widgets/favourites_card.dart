import 'package:countries_app/app/app.dart';
import 'package:countries_app/data/data.dart';
import 'package:countries_app/di/di.dart';
import 'package:flutter/material.dart';
import 'package:countries_app/domain/repository/model/article.dart';
import 'package:go_router/go_router.dart';

class FavouritesCard extends StatefulWidget {
  final Article article;

  const FavouritesCard({super.key, required this.article});

  @override
  State<FavouritesCard> createState() => _FavouritesCardState();
}

class _FavouritesCardState extends State<FavouritesCard> {
  final _favouritesBloc = getIt<FavouritesBloc>();
  bool isRemoved = false;

  @override
  Widget build(BuildContext context) {
    if (isRemoved) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: const Color.fromARGB(255, 248, 205, 205), width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          Endpoints.countryDetails = Endpoints.countryDetails
              .replaceAll('ID', widget.article.wikiDataId.toString());
          context.go('/home/article/${widget.article.wikiDataId}');
        },
        borderRadius: BorderRadius.circular(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Text(
                widget.article.code,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.article.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                setState(() {
                  isRemoved = true;
                });
                _favouritesBloc
                    .add(FavouritesDelete(widget.article.wikiDataId));
              },
            ),
          ],
        ),
      ),
    );
  }
}
