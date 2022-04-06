import 'package:aguia_real_dbv/src/modules/event/event_controller.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class EventEditPage extends StatefulWidget {
  const EventEditPage({Key? key, required this.event}) : super(key: key);

  final ParseObject event;

  @override
  State<EventEditPage> createState() => _EventEditPageState();
}

class _EventEditPageState extends State<EventEditPage> {
  @override
  Widget build(BuildContext context) {
    final ParseObject event = widget.event;
    final controller = context.watch<EventController>();

    setState(() {
      controller.setFinalEventDate(event['finalDate']);
      controller.setEventDate(event['date']);
    });

    Future<void> _selectDate(context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: event['date'],
          firstDate: DateTime.now(),
          lastDate: DateTime(2101));
      if (picked != null && picked != controller.eventDate) {
        controller.setEventDate(picked);
      }
    }

    Future<void> _selectFinalDate(context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: event['finalDate'],
          firstDate: event['date'],
          lastDate: DateTime(2101));
      if (picked != null) {
        controller.setFinalEventDate(picked);
      }
    }

    return Scaffold(
      backgroundColor: Utils.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Observer(
              builder: (c) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'ATUALIZAR EVENTO',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Utils.darkBlue,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Nome do evento',
                      style: TextStyle(color: Utils.darkBlue, fontSize: 15.0),
                    ),
                    TextFormField(
                      initialValue: event['name'],
                      onChanged: controller.setEventName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.description,
                          color: Utils.greyDark,
                          size: 25,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Utils.primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Data de início',
                          style:
                              TextStyle(color: Utils.darkBlue, fontSize: 15.0),
                        ),
                        Text(
                          'Data anterior: ${event['date'].day}/${event['date'].month}/${event['date'].year}',
                          style:
                              TextStyle(color: Utils.darkBlue, fontSize: 15.0),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => _selectDate(c),
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Utils.greyDark,
                            size: 25,
                          ),
                          label: Text(
                            '${controller.eventDate.day}/${controller.eventDate.month}/${controller.eventDate.year}',
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Utils.primaryColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Data de término',
                          style:
                              TextStyle(color: Utils.darkBlue, fontSize: 15.0),
                        ),
                        Text(
                          'Data anterior: ${event['finalDate'].day}/${event['finalDate'].month}/${event['finalDate'].year}',
                          style:
                              TextStyle(color: Utils.darkBlue, fontSize: 15.0),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => _selectFinalDate(c),
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Utils.greyDark,
                            size: 25,
                          ),
                          label: Text(
                            '${controller.finalEventDate.day}/${controller.finalEventDate.month}/${controller.finalEventDate.year}',
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Utils.primaryColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      'Pontuação para 5 estrelas',
                      style: TextStyle(color: Utils.darkBlue, fontSize: 15.0),
                    ),
                    TextFormField(
                      initialValue: event['maxScore'].toString(),
                      onChanged: controller.setEventMaxScore,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.score,
                          color: Utils.greyDark,
                          size: 25,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Utils.primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        controller.editEvent(id: event['objectId']);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Utils.greenAction,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: controller.isLoading
                              ? LoadingAnimationWidget.inkDrop(
                                  color: Colors.white,
                                  size: 20,
                                )
                              : const Text(
                                  'ATUALIZAR',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
