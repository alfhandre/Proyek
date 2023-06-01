import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/event_controller.dart';

class EventListView extends StatelessWidget {
  EventController eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: Obx(() => eventController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: eventController.eventModel?.eventList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(
                        eventController.eventModel?.eventList![index].title ??
                            'no title'),
                    subtitle: Text(eventController
                            .eventModel?.eventList![index].description ??
                        'no description'),
                    onTap: () {},
                  ));
                })));
  }
}
