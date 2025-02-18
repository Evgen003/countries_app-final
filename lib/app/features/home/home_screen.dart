import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/app/app.dart';
import 'package:countries_app/di/di.dart';
import 'package:countries_app/domain/domain.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var offset = 0;

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = HomeBloc(getIt<GeoRepository>());
  final AuthBloc _authBloc = AuthBloc(getIt<AuthService>());
  @override
  void initState() {
    _homeBloc.add(const HomeLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                context.go('/home/favourites');
              },
              tooltip: 'Favourites',
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _authBloc.add(LogOutRequested());
              },
              tooltip: 'LogOut',
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: BlocListener<AuthBloc, AuthState>(
            bloc: _authBloc,
            listener: (context, state) {
              if (state is AuthSuccess) {
                context.go('/auth');
              }
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Exit error!'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
              if (state is AuthInProgress) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Bye Bye!'),
                    backgroundColor: Color.fromARGB(255, 54, 222, 244),
                  ),
                );
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              bloc: _homeBloc,
              builder: (context, state) {
                if (state is HomeLoadInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is HomeLoadSuccess) {
                  List<Article> articles = state.articles;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Страны',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        20.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (offset > 0) {
                                      offset -= 1;
                                    }
                                  });
                                  _homeBloc.add(const HomeLoadBack());
                                },
                                child: const Text('prev')),
                            Text(
                              '$offset',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    offset += 1;
                                  });
                                  _homeBloc.add(const HomeLoadAdd());
                                },
                                child: const Text('next'))
                          ],
                        ),
                        ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return ArticleCard(
                              article: articles[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return 20.ph;
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is HomeLoadFailure) {
                  return ErrorCard(
                    title: 'Ошибка',
                    description: state.exception.toString(),
                    onReload: () {
                      _homeBloc.add(const HomeLoad());
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
