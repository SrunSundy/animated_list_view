import 'package:animated_listview/colors.dart';
import 'package:animated_listview/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceWidget extends StatelessWidget {
  final PlaceListData? item;
  final Animation<double>? animation;
  final AnimationController? animationController;
  const PlaceWidget({ Key? key , this.item, this.animation, this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,

      builder: (context, child) {
        return FadeTransition(
          opacity: animation!,

          child: Transform(
            transform: Matrix4.translationValues(0, 50 * (1 - animation!.value), 0),
            child: Container(
              color: white,
              padding: EdgeInsets.only(left: 25, right: 25, top:8, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.6),
                      offset: Offset(4,4),
                      blurRadius: 16
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 2,
                          child: Image.asset(
                            item!.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Container(
                          color: white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 16, bottom: 8, top: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item!.title,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(item!.sub, style: TextStyle(
                                            color: Colors.black.withOpacity(0.4),
                                            fontSize: 14
                                          ),),
                                          SizedBox(width: 5,),
                                          Icon(
                                            FontAwesomeIcons.locationDot,
                                            size: 13,
                                            color: primary,
                                          ),
                                          Expanded(
                                            child: Text(" ${item!.distance} km to city",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.black.withOpacity(0.4),
                                                fontSize: 14
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                                      Container(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [

                                            RatingBar(
                                              initialRating: item!.rating,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 24,
                                              ratingWidget: RatingWidget(
                                                full: Icon(Icons.star_rate_rounded, color: primary,),
                                                half: Icon(Icons.star_half_rounded, color: primary,),
                                                empty: Icon(Icons.star_border_rounded, color: primary,) 
                                              ), 
                                              itemPadding: EdgeInsets.zero,
                                              onRatingUpdate: (value) {

                                              }
                                            ),
                                            Text("${item!.reviews} Reviews", 
                                            style: TextStyle(
                                                color: Colors.black.withOpacity(0.4),
                                                fontSize: 14
                                              ),)
                                          ]
                                        ),
                                      )
                                      
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                padding: EdgeInsets.only(right: 16, top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("\$${item!.perNight}", style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22
                                    ),),
                                    Text("/ per night", style: TextStyle(
                                                color: Colors.black.withOpacity(0.4),
                                                fontSize: 14
                                              ))
                                ],)
                              )


                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ),
          ),
        );
      }
    );
  }
}