


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ric_and_morty/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:ric_and_morty/feature/characters/presentation/widgets/characters_cart_widget.dart';
import 'package:ric_and_morty/feature/characters/presentation/widgets/custom_text_field_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  void _setupScrollController(BuildContext context) {
    _scrollController.addListener(() {
      if (_focusNode.hasFocus) {
        _focusNode.unfocus();
      }
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0 ) {
          context.read<CharacterBloc>().add(
                const CharacterLoadingAddPageEvent(),
              );
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characterBloc = context.read<CharacterBloc>();
    _setupScrollController(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextFieldWidget(focusNode: _focusNode, characterBloc: characterBloc),
            CharactersCartWidget(scrollController: _scrollController),
          ],
        ),
      ),
    );
  }
}


