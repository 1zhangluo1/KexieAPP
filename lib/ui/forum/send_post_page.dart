import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/forum/send_post_controller.dart';
import 'package:kexie_app/widgets/toast.dart';

class SendPostPage extends StatelessWidget {
  const SendPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SendPostController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('发帖'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                child: const Text(
                  '发送',
                  style: TextStyle(fontSize: 16, letterSpacing: 2),
                ),
                onPressed: () async {
                  if (c.images.isNotEmpty || c.contentController.text.isNotEmpty) {
                    await c.uploadPost(context);
                  } else {
                    toast('帖子还未编辑');
                  }
                },
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                _PostInputField(),
                _ImageGrid(),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _CategoryAndCounter(),
              _BottomToolbar(),
            ],
          )
        ],
      ),
    );
  }
}

class _PostInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              "image/kexie_logo.png",
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: TextField(
                controller: c.contentController,
                maxLines: null,
                maxLength: 500,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  border: InputBorder.none, // 去掉默认的底部边框线
                  hintText: '快来分享今天的趣事吧！',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryAndCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          // 类别选择器
          // Expanded(
          //   child: Obx(() {
          //     return DropdownButton<String>(
          //       isExpanded: true,
          //       borderRadius: BorderRadius.circular(8),
          //       padding: EdgeInsets.symmetric(horizontal: 16.0),
          //       value: c.selectedCategory.value,
          //       items: c.categories.map((category) {
          //         return DropdownMenuItem<String>(
          //           value: ,
          //           child: Text(category),
          //         );
          //       }).toList(),
          //       onChanged: (value) {
          //         c.selectedCategory.value = value;
          //       },
          //     );
          //   }),
          // ),
          const SizedBox(width: 4),
          // 字数计数器
          Obx(() => Text(
                '已输入 ${c.textNum.value} / 500',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              )),
        ],
      ),
    );
  }
}

class _ImageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return Expanded(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: c.images.length,
            itemBuilder: (context, index) {
              final image = c.images[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Image.file(
                      File(image.path),
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () => c.images.remove(image),
                        icon: Icon(Icons.close,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _BottomToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.find<SendPostController>();
    return SafeArea(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  c.pickImage();
                                },
                                icon: Icon(
                                  Icons.image_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              const SizedBox(width: 4),
                              IconButton(
                                onPressed: () {
                                  c.toggleEmojiPicker();
                                },
                                icon: Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              const SizedBox(width: 4),

                              // IconButton(
                              //   onPressed: () {
                              //     _showVisibilityBottomSheet(context, c);
                              //   },
                              //   icon: Icon(
                              //     Icons.visibility,
                              //     color:
                              //         Theme.of(context).colorScheme.primary,
                              //   ),
                              // ),
                              //const SizedBox(width: 4),

                              // IconButton(
                              //   onPressed: () {
                              //     c.getLocation();
                              //   },
                              //   icon: Icon(
                              //     Icons.location_on_outlined,
                              //     color:
                              //         Theme.of(context).colorScheme.primary,
                              //   ),
                              // ),
                              //const SizedBox(width: 4),
                              IconButton(
                                onPressed: () {
                                  c.contentController.clear();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (c.isEmojiVisible.isTrue) const SizedBox(width: 4),
                      if (c.isEmojiVisible.isTrue)
                        IconButton(
                          onPressed: () {
                            c.toggleEmojiPicker();
                          },
                          icon: Icon(
                            Icons.keyboard_hide,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                    ],
                  ))),
          // Obx(() => PopScope(
          //       canPop: c.isEmojiVisible.isFalse, // 允许用户通过返回键关闭页面
          //       onPopInvoked: (bool didPop) {
          //         c.toggleEmojiPicker(); // 关闭emoji面板
          //       },
          //       child: Offstage(
          //         offstage: !c.isEmojiVisible.value,
          //         child: SizedBox(
          //             height: 250,
          //             child: EmojiPicker(
          //               onEmojiSelected: (category, emoji) {
          //                 // Do something when emoji is tapped (optional)
          //               },
          //               onBackspacePressed: () {
          //                 // Do something when the user taps the backspace button (optional)
          //                 // Set it to null to hide the Backspace-Button
          //               },
          //               textEditingController: c.contentController,
          //               // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
          //               config: Config(
          //                 height: 256,
          //                 checkPlatformCompatibility: true,
          //                 emojiViewConfig: EmojiViewConfig(
          //                   // Issue: https://github.com/flutter/flutter/issues/28894
          //                   emojiSizeMax: 28 *
          //                       (defaultTargetPlatform == TargetPlatform.iOS
          //                           ? 1.20
          //                           : 1.0),
          //                 ),
          //                 swapCategoryAndBottomBar: false,
          //                 skinToneConfig: const SkinToneConfig(),
          //                 categoryViewConfig: const CategoryViewConfig(),
          //                 bottomActionBarConfig: const BottomActionBarConfig(),
          //                 searchViewConfig: const SearchViewConfig(),
          //               ),
          //             )),
          //       ),
          //     )),
        ],
      ),
    );
  }
}

// void _showVisibilityBottomSheet(BuildContext context, SendPostController c) {
//   showModalBottomSheet(
//     context: context,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
//     ),
//     builder: (context) {
//       return SafeArea(
//         child: ClipRRect(
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: () {
//                     c.changeVisibility('public');
//                     Navigator.pop(context);
//                   },
//                   borderRadius:
//                       const BorderRadius.vertical(top: Radius.circular(16.0)),
//                   child: const ListTile(
//                     leading: Icon(Icons.public),
//                     title: Text('公开可见'),
//                   ),
//                 ),
//               ),
//               Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: () {
//                     c.changeVisibility('private');
//                     Navigator.pop(context);
//                   },
//                   child: const ListTile(
//                     leading: Icon(Icons.lock),
//                     title: Text('仅私密可见'),
//                   ),
//                 ),
//               ),
//               Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: () {
//                     c.changeVisibility('friends');
//                     Navigator.pop(context);
//                   },
//                   borderRadius:
//                       BorderRadius.vertical(bottom: Radius.circular(16.0)),
//                   child: ListTile(
//                     leading: Icon(Icons.group),
//                     title: Text('仅好友可见'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// class _VisibilityIndicator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final c = Get.find<SendPostController>();
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//       child: Obx(() {
//         String visibilityText;
//         IconData visibilityIcon;
//
//         switch (c.selectedVisibility.value) {
//           case 'private':
//             visibilityText = '仅私密可见';
//             visibilityIcon = Icons.lock;
//             break;
//           case 'friends':
//             visibilityText = '仅好友可见';
//             visibilityIcon = Icons.group;
//             break;
//           case 'public':
//           default:
//             visibilityText = '公开可见';
//             visibilityIcon = Icons.public;
//             break;
//         }
//
//         return Row(
//           children: [
//             Icon(
//               visibilityIcon,
//               color: Theme.of(context).colorScheme.primary,
//             ),
//             const SizedBox(width: 4),
//             Text(
//               visibilityText,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Theme.of(context).colorScheme.onSurface,
//               ),
//             ),
//             const Expanded(child: SizedBox()), // 使用Expanded占据剩余空间
//             Text(
//               '允许评论',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Theme.of(context).colorScheme.onSurface,
//               ),
//             ),
//             Checkbox(
//               value: c.allowReplies.value,
//               onChanged: (bool? value) {
//                 if (value != null) {
//                   c.allowReplies.value = value;
//                 }
//               },
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
