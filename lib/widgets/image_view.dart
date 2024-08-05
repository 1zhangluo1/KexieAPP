
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:saver_gallery/saver_gallery.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key, required this.imgUrl,});

  final String imgUrl;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Center(
            child: CachedNetworkImage(
              imageUrl: widget.imgUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(strokeWidth: 1,),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => PhotoView(
                imageProvider: imageProvider,
                backgroundDecoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
              ),
            )),
      ),
    );
  }
}
