import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/models/kexie_members/kexie_members.dart';
import 'package:kexie_app/widgets/image_view.dart';

class MemberInfoPage extends StatefulWidget {
  const MemberInfoPage({super.key, required this.member});
  
  final Data member;

  @override
  State<MemberInfoPage> createState() => _MemberInfoPageState();
}

class _MemberInfoPageState extends State<MemberInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.member.name}主页'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.3), // 阴影颜色
                      spreadRadius: 0.5, // 阴影扩散程度
                      blurRadius: 6, // 阴影模糊半径
                      offset: const Offset(0, 5), // 阴影偏移量
                    ),
                  ],
                ),
                height: 150,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onDoubleTap: () => Get.to(ImageView(imgUrl: 'http://jzhangluo.com:9000${widget.member.avatar}'),transition: Transition.cupertino),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl:
                              'http://jzhangluo.com:9000${widget.member.avatar}',
                              fit: BoxFit.cover,
                              height: 110,
                              width: 110,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('姓名',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                              SelectableText(widget.member.name,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('学号',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                              SelectableText(widget.member.studentId,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('年级',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                              SelectableText('${widget.member.grade}级',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(flex: 1,child: Text('邮箱',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),)),
                              Flexible(flex:3,child: SelectableText(widget.member.email,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('部门',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                              SelectableText(widget.member.department,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('学习方向',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                              SelectableText(widget.member.learnDirection,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: double.infinity,
                          height: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('所在科协教室',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                              SelectableText(widget.member.location,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
