import 'package:flutter/material.dart';
import 'package:kexie_app/gen/assets.gen.dart';
import 'package:photo_view/photo_view.dart';

class SchoolMap extends StatelessWidget {
  const SchoolMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学校地图'),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: AssetImage(Assets.image.schoolMap.path),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 3,
          backgroundDecoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        )
      ),
    );
  }
}
