import 'package:countries_app/data/data.dart';
import 'package:countries_app/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:countries_app/app/app.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({
    super.key,
    required this.article,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // для следующей лабораторной работы
        Endpoints.countryDetails = "countries/${article.wikiDataId}";

        context.go('/home/article/1');
      },
      borderRadius: BorderRadius.circular(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                5.ph,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
