part of 'meme_bloc_bloc.dart';

abstract class MemeBlocEvent extends Equatable {
  const MemeBlocEvent();

  @override
  List<Object> get props => [];
}

class MemeRequest extends MemeBlocEvent {}
