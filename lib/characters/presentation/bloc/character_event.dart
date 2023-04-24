// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class CharacterLoadingPageEvent extends CharacterEvent {
  final bool isQuery ;
  const CharacterLoadingPageEvent({
    this.isQuery = false,
  });
   
}

class CharacterLoadingAddPageEvent extends CharacterEvent {
  const CharacterLoadingAddPageEvent();
   
}


class CharacterSearchEvent extends CharacterEvent {
  final String query;
  const CharacterSearchEvent({
    required this.query,
  });
}
