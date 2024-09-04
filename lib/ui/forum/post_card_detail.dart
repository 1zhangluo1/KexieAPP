import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:kexie_app/widgets/image_view.dart';
import 'package:kexie_app/widgets/toast.dart';
import '../../models/forum_posts/forum_posts.dart';
import 'post_card.dart';
import 'post_detail_controller.dart';

class PostCardDetail extends StatefulWidget {
  const PostCardDetail(
      {super.key,
      required this.post,
      required this.watchCount,
      required this.onChangeLikePost});

  final Post post;
  final OnChangeLikePost onChangeLikePost;
  final Rx<int> watchCount;

  @override
  State<PostCardDetail> createState() => _PostCardDetailState();
}

class _PostCardDetailState extends State<PostCardDetail> {
  final datetimeFormat = DateFormat("yyyy-MM-dd HH:mm");

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PostDetailController>(tag: widget.post.iD.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (kDebugMode) {
                      print("跳转到个人信息界面，待完成");
                    }
                  },
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          'http://jzhangluo.com:9000${widget.post.userProfile.avatar}',
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                      errorWidget: (c, url, error) {
                        return Image.asset(
                          "assets/images/logo.png",
                          width: 36,
                          height: 36,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.post.userProfile.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.post.text.isNotEmpty)
                  SelectableText(
                    widget.post.text,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                if (widget.post.images.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: _buildImageGrid(),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  datetimeFormat
                      .format(DateTime.parse(widget.post.createdAt).toLocal()),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Obx(() => Text(
                      widget.watchCount.toString(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                const Text(
                  '查看',
                  style: TextStyle(fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                  '${widget.post.likesCount} ',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  '喜欢',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 0.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  toast('评论');
                },
                icon: const Icon(Icons.messenger_outline_rounded),
              ),
              IconButton(
                onPressed: () async {
                  final result =
                      await widget.onChangeLikePost(widget.post.isLiked);
                  setState(() {
                    widget.post.isLiked = result;
                    widget.post.likesCount =
                        widget.post.likesCount + (result ? 1 : -1);
                  });
                },
                icon: widget.post.isLiked
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border_outlined),
              ),
            ],
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 0.2,
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    int imageCount = widget.post.images.length;

    if (imageCount == 1) {
      return ImageWidget(
        imageUrl: widget.post.images.first,
        imageList: widget.post.images,
        initialIndex: 0,
      );
    } else if (imageCount == 2) {
      return Row(
        children: widget.post.images
            .asMap()
            .entries
            .map((entry) => Expanded(
                  child: ImageWidget(
                    imageUrl: entry.value,
                    imageList: widget.post.images,
                    initialIndex: entry.key,
                  ),
                ))
            .toList(),
      );
    } else if (imageCount == 3) {
      return Column(
        children: [
          Row(
            children: widget.post.images
                .take(2)
                .toList()
                .asMap()
                .entries
                .map((entry) => Expanded(
                      child: ImageWidget(
                        imageUrl: entry.value,
                        imageList: widget.post.images,
                        initialIndex: entry.key,
                      ),
                    ))
                .toList(),
          ),
          ImageWidget(
            imageUrl: widget.post.images[2],
            imageList: widget.post.images,
            initialIndex: 2,
          ),
        ],
      );
    } else if (imageCount == 4) {
      return Column(
        children: [
          Row(
            children: widget.post.images
                .take(2)
                .toList()
                .asMap()
                .entries
                .map((entry) => Expanded(
                      child: ImageWidget(
                        imageUrl: entry.value,
                        imageList: widget.post.images,
                        initialIndex: entry.key,
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: widget.post.images
                .skip(2)
                .take(2)
                .toList()
                .asMap()
                .entries
                .map((entry) => Expanded(
                      child: ImageWidget(
                        imageUrl: entry.value,
                        imageList: widget.post.images,
                        initialIndex: entry.key + 2,
                      ),
                    ))
                .toList(),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: widget.post.images
                .take(2)
                .toList()
                .asMap()
                .entries
                .map((entry) => Expanded(
                      child: ImageWidget(
                        imageUrl: entry.value,
                        imageList: widget.post.images,
                        initialIndex: entry.key,
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: widget.post.images
                .skip(2)
                .take(2)
                .toList()
                .asMap()
                .entries
                .map((entry) => Expanded(
                      child: ImageWidget(
                        imageUrl: entry.value,
                        imageList: widget.post.images,
                        initialIndex: entry.key + 2,
                      ),
                    ))
                .toList(),
          ),
          if (imageCount > 4)
            OverlayImageWidget(
              imageUrl: widget.post.images[4],
              remainingCount: imageCount - 4,
              imageList: widget.post.images,
              initialIndex: 4,
            ),
        ],
      );
    }
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final List<String> imageList;
  final int initialIndex;

  const ImageWidget({
    super.key,
    required this.imageUrl,
    required this.imageList,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0, // Set a fixed aspect ratio
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Get.to(ImageView(imgUrl: imageUrl, backgroundColor: Colors.black),
                transition: Transition.fadeIn);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}

class OverlayImageWidget extends StatelessWidget {
  final String imageUrl;
  final int remainingCount;
  final List<String> imageList;
  final int initialIndex;

  const OverlayImageWidget({
    super.key,
    required this.imageUrl,
    required this.remainingCount,
    required this.imageList,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image layer, ensures image is clickable
        InkWell(
          onTap: () {
            Get.to(ImageView(imgUrl: imageUrl, backgroundColor: Colors.black),
                transition: Transition.fadeIn);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        // Overlay layer to display the number of remaining images
        Positioned.fill(
          child: InkWell(
            onTap: () {
              Get.to(ImageView(imgUrl: imageUrl, backgroundColor: Colors.black),
                  transition: Transition.fadeIn);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                alignment: Alignment.center,
                color: Colors.black54.withOpacity(0.5), // Overlay transparency
                child: Text(
                  '+$remainingCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
