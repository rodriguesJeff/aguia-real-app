import 'dart:io';

import 'package:aguia_real_dbv/src/modules/event/event_controller.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class EventCreatePage extends StatefulWidget {
  const EventCreatePage({Key? key}) : super(key: key);

  @override
  State<EventCreatePage> createState() => _EventCreatePageState();
}

class _EventCreatePageState extends State<EventCreatePage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EventController>();

    Future<void> _selectDate(context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: controller.eventDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2101));
      if (picked != null && picked != controller.eventDate) {
        controller.setEventDate(picked);
      }
    }

    Future<void> _selectFinalDate(context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: controller.eventDate,
          firstDate: controller.eventDate,
          lastDate: DateTime(2101));
      if (picked != null && picked != controller.eventDate) {
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
            height: MediaQuery.of(context).size.height,
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
                      'CADASTRO DE EVENTO',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Utils.darkBlue,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // GestureDetector(
                    //   child: controller.pickedFile != null
                    //       ? Container(
                    //           width: 250,
                    //           height: 250,
                    //           decoration: BoxDecoration(
                    //               border: Border.all(color: Colors.blue)),
                    //           child: kIsWeb
                    //               ? Image.network(controller.pickedFile!.path)
                    //               : Image.file(
                    //                   File(controller.pickedFile!.path)))
                    //       : Container(
                    //           width: 250,
                    //           height: 250,
                    //           decoration: BoxDecoration(
                    //               border: Border.all(color: Colors.blue)),
                    //           child: Center(
                    //             child: Text(
                    //                 'Click here to pick image from Gallery'),
                    //           ),
                    //         ),
                    //   onTap: () async {
                    //     controller.getImage();
                    //   },
                    // ),
                    Text(
                      'Nome do evento',
                      style: TextStyle(color: Utils.darkBlue, fontSize: 15.0),
                    ),
                    TextFormField(
                      initialValue: controller.eventName,
                      onChanged: controller.setEventName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Utils.primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      'Data de início',
                      style: TextStyle(color: Utils.darkBlue, fontSize: 15.0),
                    ),
                    InkWell(
                      onTap: () => _selectDate(c),
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          label: Text(
                              '${controller.eventDate.day}/${controller.eventDate.month}/${controller.eventDate.year}'),
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
                      'Data de término',
                      style: TextStyle(color: Utils.darkBlue, fontSize: 15.0),
                    ),
                    InkWell(
                      onTap: () => _selectFinalDate(c),
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          label: Text(
                              '${controller.finalEventDate.day}/${controller.finalEventDate.month}/${controller.finalEventDate.year}'),
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
                      'Pontuação máxima',
                      style: TextStyle(color: Utils.darkBlue, fontSize: 15.0),
                    ),
                    TextFormField(
                      initialValue: controller.eventMaxScore.toString(),
                      onChanged: controller.setEventMaxScore,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
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
                        controller.submitForm();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Utils.greenAction,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(
                          child: Text(
                            'CADASTRAR',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
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
