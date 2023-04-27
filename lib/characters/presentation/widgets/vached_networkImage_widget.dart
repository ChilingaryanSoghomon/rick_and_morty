import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:ric_and_morty/internet_connection/cubit/internet_connection_cubit.dart';

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
    return BlocBuilder<InternetConnectionCubit, InternetStatus>(
      builder: (context, state) {
        if (state == InternetStatus.connected) {
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
        return SizedBox(
          width: imageSide,
          height: imageSide,
          child: _imageWidget(
            const AssetImage('assets/images/noimage.jpg'),
          ),
        );
      },
    );
  }
}
