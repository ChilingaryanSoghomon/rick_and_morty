// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ric_and_morty/feature/characters/domain/entities/character/character.dart';
import 'package:ric_and_morty/feature/characters/domain/repositories/person_repository.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository _characterRepository;
  int _page = 0;

  CharacterBloc({required CharacterRepository characterRepository})
      : _characterRepository = characterRepository,
        super(const CharacterInitialState()) {
    on<CharacterLoadingPageEvent>(_onLoadingEvent);
    on<CharacterSearchEvent>(_onSearchEvent, transformer: sequential());
    on<CharacterLoadingAddPageEvent>(_onAddPageEvent);

  }

  Future<void> _onAddPageEvent(
      CharacterLoadingAddPageEvent event, Emitter<CharacterState> emit) async {
    if (state is CharacterLoadedState) {
      add(const CharacterLoadingPageEvent());
    }else if (state is CharacterLoadedSearchState){
      return;
    }
  }

  Future<void> _onLoadingEvent(
      CharacterLoadingPageEvent event, Emitter<CharacterState> emit) async {
    if (state is CharacterLoadingState) {
      return;
    }
    if (event.isQuery) {
      _page = 0;
      final characters = await _characterRepository.getAllCharacter(_page);
      emit(CharacterLoadedState(character: characters));
    } else {
      final currentState = state;
      List<Character> oldCharacters = [];
      if (currentState is CharacterLoadedState) {
        oldCharacters = currentState.character;
      }
      emit(CharacterLoadingState(oldCharacters));
      _page += 1;
      final nextCharacters = await _characterRepository.getAllCharacter(_page);
      List<Character> characters = oldCharacters;
      characters.addAll(nextCharacters);
      emit(CharacterLoadedState(character: characters));
    }
  }

  Future<void> _onSearchEvent(
      CharacterSearchEvent event, Emitter<CharacterState> emit) async {
    if (state is CharacterLoadingState) {
      return;
    }
    emit(const CharacterInitialState());
    try {
      final List<Character> searchCharacters =
          await _characterRepository.searchPerson(event.query);
      if (searchCharacters.isNotEmpty) {
        emit(CharacterLoadedSearchState(character: searchCharacters));
      }
    } catch (e) {
      emit(const CharacterErrorState());
    }
  }
}
