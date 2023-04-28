part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}


class CharacterInitialState extends CharacterState {
  const CharacterInitialState();
}

class CharacterLoadingState extends CharacterState {
  final List<Character> oldCharacterList;
  final bool isFirstFetch;

  const CharacterLoadingState(this.oldCharacterList,
      {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldCharacterList];
}

class CharacterLoadedState extends CharacterState {
  const CharacterLoadedState({required this.character});
  final List<Character> character;
}

class CharacterLoadedSearchState extends CharacterState {
  const CharacterLoadedSearchState({required this.character});
  final List<Character> character;
}

class CharacterErrorState extends CharacterState {
  const CharacterErrorState();
}
