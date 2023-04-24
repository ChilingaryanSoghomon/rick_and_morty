import 'package:flutter/material.dart';
import 'package:ric_and_morty/characters/domain/entities/character/character.dart';
import 'package:ric_and_morty/characters/presentation/widgets/vached_networkImage_widget.dart';

class CharactersCardWidget extends StatelessWidget {
  final Character character;

  const CharactersCardWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _imageSide = MediaQuery.of(context).size.height / 5;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CachedNetworkImageWidget(
              imageSide: _imageSide,
              imageUrl: character.image,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: character.status == 'Alive'
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          '${character.status} - ${character.species}',
                          style: const TextStyle(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Last known location:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    character.location.name,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Origin:',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    character.origin.name,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
