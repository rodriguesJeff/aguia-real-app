import 'package:aguia_real_dbv/src/modules/event/event_controller.dart';
import 'package:aguia_real_dbv/src/modules/event/pages/event_create_page.dart';
import 'package:aguia_real_dbv/src/modules/event/pages/event_edit_page.dart';
import 'package:aguia_real_dbv/src/modules/event/widgets/event_widget.dart';
import 'package:aguia_real_dbv/src/shared/models/event.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:aguia_real_dbv/src/views/event_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ListEventsPage extends StatefulWidget {
  const ListEventsPage({Key? key}) : super(key: key);

  @override
  State<ListEventsPage> createState() => _ListEventsPageState();
}

class _ListEventsPageState extends State<ListEventsPage> implements EventView {
  late EventController controller;
  @override
  void initState() {
    controller = EventController(this);
    controller.initPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      appBar: AppBar(
        backgroundColor: Utils.primaryColor,
        title: const Text('Eventos'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => Provider.value(
                  value: EventController(this),
                  child: const EventCreatePage(),
                ),
              ),
            ),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(builder: (_) {
          if (controller.isLoading) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.white));
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  for (var e in controller.events)
                    eventWidget(
                      context,
                      event: Event(
                        eventID: e['objectId'],
                        eventName: e['name'],
                        eventDate: e['date'],
                        finalEventDate: e['finalDate'],
                        eventMaxScore: e['maxScore'],
                      ),
                      onRemove: () => controller.removeEvent(e['objectId']),
                      onEdit: () => controller.getSpecificEvent(e['objectId']),
                    ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  @override
  void backToTheEvents() {
    controller.getEvents();
    Navigator.pop(context);
  }

  @override
  void goToEditEvent(ParseObject event) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (c) {
        return Provider.value(
          value: EventController(this),
          child: EventEditPage(event: event),
        );
      }),
    );
  }
}
