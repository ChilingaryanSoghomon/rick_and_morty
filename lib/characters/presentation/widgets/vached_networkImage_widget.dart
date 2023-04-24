import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ric_and_morty/characters/domain/entities/character/character.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageSide,
    required this.imageUrl,
  });

  final double imageSide;
  final String imageUrl;

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(9),
          bottomLeft: Radius.circular(9),
        ),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: imageSide,
      height: imageSide,
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          value: 20,
        ),
      ),
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },   
      errorWidget: (context, url, error) {
        return _imageWidget(
          const AssetImage('assets/images/noimage.jpg'),
        );
      },
    );
  }
}
