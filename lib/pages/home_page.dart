import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_app/blocs/meme_bloc/meme_bloc_bloc.dart';
import 'package:meme_app/widgets/buttons.dart';
import 'package:meme_app/widgets/text_widget.dart';
import 'package:share/share.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Meme share'),
        ),
        body: Column(
          children: [
            BlocBuilder<MemeBlocBloc, MemeBlocState>(
              builder: (context, state) {
                if (state is MemeInitial) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Tap on Meme button',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                }
                if (state is MemeLoadInProgress) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                }
                if (state is MemeLoadSuccess) {
                  final meme = state.meme;
                  return Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: size.height * .45,
                        color: Colors.pink,
                        child: Image.network(
                          meme.url,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        value: meme.subreddit,
                        title: 'SubReddit:',
                      ),
                      TextWidget(
                        value: meme.author,
                        title: 'Author:',
                      ),
                      TextWidget(
                        value: meme.ups.toString(),
                        title: 'UPs:',
                      ),
                      CustomButton(
                        text: 'Share',
                        onPressed: () {
                          Share.share(meme.postLink,
                              subject: 'Check this funny Meme 🤣');
                        },
                      ),
                    ],
                  );
                } else if (state is MemeLoadFailure) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Text(
                          'Something went wrong!',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            Spacer(),
            CustomButton(
              text: 'Meme',
              onPressed: () {
                BlocProvider.of<MemeBlocBloc>(context).add(MemeRequest());
              },
            )
          ],
        ));
  }
}
