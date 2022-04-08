import 'package:aguia_real_dbv/src/shared/models/event.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      appBar: AppBar(
        title: const Text('EVENTO'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30.0),
                Image.asset(
                  'assets/images/camping.png',
                  width: 200,
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    event.eventName.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Utils.darkBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'INÍCIO',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Utils.darkBlue,
                          ),
                        ),
                        Text(
                          '${event.eventDate.day}/${event.eventDate.month}/${event.eventDate.year}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Utils.greyMid,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'TÉRMINO',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Utils.darkBlue,
                          ),
                        ),
                        Text(
                          '${event.finalEventDate.day}/${event.finalEventDate.month}/${event.finalEventDate.year}',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Utils.greyMid,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  'PONTUAÇÃO MÁXIMA',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Utils.darkBlue,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '${event.eventMaxScore} pontos',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Utils.greyMid,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'PRÉ REQUISITOS',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Utils.darkBlue,
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Utils.greenAction),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('ADICIONAR PONTOS'),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'REQUISITOS',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Utils.darkBlue,
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Utils.greenAction),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('ADICIONAR PONTOS'),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
