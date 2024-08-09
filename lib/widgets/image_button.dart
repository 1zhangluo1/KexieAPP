import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({super.key, required this.title, required this.imagePath,this.color,required this.function});

  final String imagePath;
  final String title;
  final Color?  color;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath,height: 40,width: 40,color: color,),
          const SizedBox(
            height: 10,
          ),
          Text(title,style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16
          ),)
        ],
      ),
    );
  }
}
