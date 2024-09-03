import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../models/forum_posts/forum_posts.dart';
import '../../widgets/image_view.dart';

typedef OnChangeLikePost = Future<bool> Function(bool isLiked);

class PostCard extends StatefulWidget {
  final Post post;
  final OnChangeLikePost onChangeLikePost;

  const PostCard({super.key, required this.post, required this.onChangeLikePost});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final datetimeFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(AppRoute.postDetailPage,
        //     preventDuplicates: false,
        //     arguments: PostDetailPageArgs(post: widget.post));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: 'http://jzhangluo.com:9000${widget.post.userProfile.avatar}',
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                  errorWidget: (c, url, error) {
                    return Image.asset(
                      "image/kexie_logo.png",
                      width: 36,
                      height: 36,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.userProfile.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        datetimeFormat.format(
                            DateTime.parse(widget.post.createdAt).toLocal()),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  if (widget.post.text.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        widget.post.text,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  if (widget.post.images.isNotEmpty == true)
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxHeight: 200, maxWidth: double.infinity),
                          child: LayoutBuilder(builder: (context, con) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                Get.to(
                                  ImageView(
                                    backgroundColor: Colors.black,
                                    imgUrl: widget.post.images.first,
                                  ),
                                  transition: Transition.fadeIn,
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: widget.post.images.first,
                                  fit: BoxFit.cover,
                                  height: con.maxHeight,
                                  width: con.maxWidth,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            );
                          })),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Get.toNamed(AppRoute.postDetailPage,
                            //     preventDuplicates: false,
                            //     arguments:
                            //         PostDetailPageArgs(post: widget.post));
                          },
                          icon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.messenger_outline_rounded,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Text(widget.post.repliesCount.toString()),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            try {
                              final result = await widget
                                  .onChangeLikePost(widget.post.isLiked);
                              setState(() {
                                widget.post.isLiked = result;
                                widget.post.likesCount =
                                    widget.post.likesCount + (result ? 1 : -1);
                              });
                            } catch (e) {
                              print(e);
                            }
                          },
                          icon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  widget.post.isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Text(widget.post.likesCount.toString()),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.equalizer_outlined,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Text(widget.post.watchCount.toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
