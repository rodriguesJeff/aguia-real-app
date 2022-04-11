import 'package:aguia_real_dbv/src/shared/services/get_stars.dart';
import 'package:aguia_real_dbv/src/shared/services/get_unity_logo.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

Widget unityInfo({required String name, required num score, m}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10.0),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(getUnityLogo(name)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Utils.greyMid,
                fontSize: 20,
              ),
            ),
            RatingBarIndicator(
              rating: 5,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: getStars(score),
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
        const SizedBox.shrink(),
        const SizedBox.shrink(),
        const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            '$score\npts',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Utils.greyDark,
            ),
          ),
        ),
      ],
    ),
  );
}
