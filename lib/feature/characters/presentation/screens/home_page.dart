import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ric_and_morty/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:ric_and_morty/feature/characters/presentation/widgets/characters_cart_widget.dart';
import 'package:ric_and_morty/feature/characters/presentation/widgets/custom_text_field_widget.dart';
import 'package:ric_and_morty/generated/locale_keys.g.dart';

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
        if (_scrollController.position.pixels != 0) {
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.rick_and_morty.tr()),
      ),
      endDrawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextFieldWidget(
            focusNode: _focusNode,
            characterBloc: characterBloc,
          ),
          CharactersCartWidget(
            scrollController: _scrollController,
          ),
        ],
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Text(
                LocaleKeys.settings.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<Locale>(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<Locale>>[
                  PopupMenuItem<Locale>(
                    value: const Locale('hy'),
                    child: Text(LocaleKeys.armenian.tr()),
                  ),
                  PopupMenuItem<Locale>(
                    value: const Locale('en'),
                    child: Text(LocaleKeys.english.tr()),
                  ),
                  PopupMenuItem<Locale>(
                    value: const Locale('ru'),
                    child: Text(LocaleKeys.russian.tr()),
                  ),
                ];
              },
              onSelected: (Locale selectedLocale) {
                context.setLocale(selectedLocale);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30, right: 20),
                      child: Icon(Icons.language),
                    ),
                    Text(
                      LocaleKeys.language.tr(),
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
