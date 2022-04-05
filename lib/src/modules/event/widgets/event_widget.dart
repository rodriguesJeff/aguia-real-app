import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter/material.dart';

Widget eventWidget({
  required String eventName,
  required DateTime eventDate,
  required DateTime finalEventDate,
  required num eventMaxScore,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'images/camping.png',
          width: 150,
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(eventName.toUpperCase()),
            Text(
                'Início ${eventDate.day}/${eventDate.month}/${eventDate.year}'),
            Text(
                'Término ${finalEventDate.day}/${finalEventDate.month}/${finalEventDate.year}'),
            Text('Pontuação máxima: ${eventMaxScore.toString()}'),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward,
          ),
          color: Utils.greyDark,
        ),
      ],
    ),
  );
}