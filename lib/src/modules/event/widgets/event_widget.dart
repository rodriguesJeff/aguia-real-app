import 'package:aguia_real_dbv/src/modules/event/pages/event_details.dart';
import 'package:aguia_real_dbv/src/shared/models/event.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter/material.dart';

Widget eventWidget(
  BuildContext context, {
  required Event event,
  required Function() onRemove,
  required Function() onEdit,
}) {
  return InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EventDetails(
          event: event,
        ),
      ),
    ),
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/camping.png',
            width: 75,
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.eventName.toUpperCase()),
              Text(
                'Início ${event.eventDate.day}/${event.eventDate.month}/${event.eventDate.year}',
                style: const TextStyle(fontSize: 10.0),
              ),
              Text(
                'Término ${event.finalEventDate.day}/${event.finalEventDate.month}/${event.finalEventDate.year}',
                style: const TextStyle(fontSize: 10.0),
              ),
              Text(
                'Pontuação máxima: ${event.eventMaxScore}',
                style: const TextStyle(fontSize: 10.0),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onEdit,
                icon: const Icon(
                  Icons.edit,
                ),
                color: Utils.greyDark,
              ),
              IconButton(
                onPressed: onRemove,
                icon: const Icon(
                  Icons.delete,
                ),
                color: Utils.greyDark,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
