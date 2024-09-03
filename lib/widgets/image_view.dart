
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
  const ImageView({super.key, required this.imgUrl, required this.backgroundColor,});

  final String imgUrl;
  final Color backgroundColor;

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
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: widget.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Center(
            child: CachedNetworkImage(
              imageUrl: widget.imgUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(strokeWidth: 5,),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => PhotoView(
                imageProvider: imageProvider,
                minScale: PhotoViewComputedScale.contained,
                backgroundDecoration: BoxDecoration(color: widget.backgroundColor),
              ),
            )),
      ),
    );
  }
}
