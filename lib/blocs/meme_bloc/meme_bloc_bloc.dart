import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meme_app/models/meme_model.dart';
import 'package:meme_app/repository/meme_repository.dart';

part 'meme_bloc_event.dart';
part 'meme_bloc_state.dart';

class MemeBlocBloc extends Bloc<MemeBlocEvent, MemeBlocState> {
  final MemeRepository memeRepository;
  MemeBlocBloc({@required this.memeRepository})
      : assert(memeRepository != null),
        super(MemeInitial());

  @override
  Stream<MemeBlocState> mapEventToState(
    MemeBlocEvent event,
  ) async* {
    if (event is MemeRequest) {
      yield MemeLoadInProgress();
      try {
        final Meme meme = await memeRepository.getMeme();
        yield MemeLoadSuccess(meme: meme);
      } catch (e) {
        yield MemeLoadFailure();
      }
    }
  }
}
