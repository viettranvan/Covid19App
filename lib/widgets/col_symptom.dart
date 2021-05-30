import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ColumnSymptom extends StatelessWidget {
  final String imgUrl;
  final String titleSymptom;

  ColumnSymptom({required this.imgUrl, required this.titleSymptom});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: this.imgUrl,
          placeholder: (context, url) => Center(child: SizedBox(child: CircularProgressIndicator(),height: 50,width: 50,),),
          imageBuilder: (context,imageProvider) => Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(width: 1.0, color: Colors.grey),
                color: Colors.white,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover
                )
            ),
          ),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
        Text(this.titleSymptom,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ))
      ],
    );
  }
}
