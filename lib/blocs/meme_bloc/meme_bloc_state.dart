part of 'meme_bloc_bloc.dart';

abstract class MemeBlocState extends Equatable {
  const MemeBlocState();

  @override
  List<Object> get props => [];
}

class MemeInitial extends MemeBlocState {}

class MemeLoadInProgress extends MemeBlocState {}

class MemeLoadSuccess extends MemeBlocState {
  final Meme meme;

  const MemeLoadSuccess({@required this.meme}) : assert(meme != null);

  @override
  List<Object> get props => [meme];
}

class MemeLoadFailure extends MemeBlocState {}
