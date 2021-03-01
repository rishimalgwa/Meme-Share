import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_app/memeBlocObserver.dart';
import 'package:meme_app/pages/home_page.dart';
import 'package:meme_app/repository/api_client.dart';
import 'package:meme_app/repository/meme_repository.dart';
import 'package:http/http.dart' as http;

import 'blocs/meme_bloc/meme_bloc_bloc.dart';

void main() {
  Bloc.observer = MemeBlocObserver();
  final MemeRepository memeRepository =
      MemeRepository(memeApiClient: MemeApiClient(httpClient: http.Client()));
  runApp(MyApp(memeRepository));
}

class MyApp extends StatelessWidget {
  final MemeRepository memeRepository;

  const MyApp(this.memeRepository) : assert(memeRepository != null);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meme Share',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => MemeBlocBloc(memeRepository: memeRepository),
        child: HomePage(),
      ),
    );
  }
}
