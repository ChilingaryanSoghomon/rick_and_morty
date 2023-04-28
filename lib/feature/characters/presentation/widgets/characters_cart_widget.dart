import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ric_and_morty/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:ric_and_morty/feature/characters/presentation/widgets/character_card_widget.dart';
import 'package:ric_and_morty/feature/characters/presentation/widgets/character_lInitial_widget.dart';

import '../../domain/entities/character/character.dart';

class CharactersCartWidget extends StatelessWidget {
  const CharactersCartWidget({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          List<Character> characters = [];
          if (state is CharacterErrorState) {
            return const Center(
              child: Text(
                'characters not founds',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (state is CharacterInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoadingState) {
            characters = state.oldCharacterList;
          }
          if (state is CharacterLoadedState) {
            characters.addAll(state.character);
          }
          if (state is CharacterLoadedSearchState) {
            characters = state.character;
          }
          return ListView.separated(
            shrinkWrap: true,
            controller: scrollController,
            itemCount: characters.length + 1,
            itemBuilder: (BuildContext context, int index) {
              scrollController.position.isScrollingNotifier;
              if (index < characters.length) {
                return CharactersCardWidget(
                  character: characters[index],
                );
              } else if (index == 0 ||
                  index == characters.length &&
                      state is CharacterLoadingState) {
                return const Center(
                  child: CharacterLInitialWidget(text: 'loading'),
                );
              } else if (index == characters.length) {
                if (state is CharacterLoadedSearchState ||
                    state is CharacterLoadedState) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'no more characters found',
                      style: TextStyle(fontSize: 20),
                    ),
                  ));
                }
              }
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey[400],
              );
            },
          );
        },
      ),
    );
  }
}
