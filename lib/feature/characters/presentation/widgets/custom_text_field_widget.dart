
import 'package:flutter/material.dart';
import 'package:ric_and_morty/feature/characters/presentation/bloc/character_bloc.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required FocusNode focusNode,
    required CharacterBloc characterBloc,
  }) : _characterBloc = characterBloc, _focusNode = focusNode;

  final FocusNode _focusNode;
  final CharacterBloc _characterBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          focusNode: _focusNode,
          onChanged: (query) {
            if (query.isNotEmpty) {
              _characterBloc.add(CharacterSearchEvent(query: query));
            }
             else {
              _characterBloc
                  .add(const CharacterLoadingPageEvent(isQuery: true));
            }
          },
          decoration:
              const InputDecoration(border: OutlineInputBorder())),
    );
  }
}