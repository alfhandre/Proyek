import 'package:calendar_view/calendar_view.dart';

class EventModel {
  EventModel({required this.eventList});

  List<EventList>? eventList;

  EventModel.fromJson(Map<String, dynamic> json) {
    if (json['event_list'] != null) {
      eventList = <EventList>[];
      json['event_list'].forEach((v) {
        eventList!.add(new EventList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eventList != null) {
      data['event_list'] = this.eventList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventList {
  String? id;
  String? creator;
  String? eventStart;
  String? eventEnd;
  String? updatedAt;
  String? description;
  String? createdAt;
  String? title;

  EventList(
      {this.id,
      this.creator,
      this.eventStart,
      this.eventEnd,
      this.updatedAt,
      this.description,
      this.createdAt,
      this.title});

  EventList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creator = json['creator'];
    eventStart = json['event_start'];
    eventEnd = json['event_end'];
    updatedAt = json['updated_at'];
    description = json['description'];
    createdAt = json['created_at'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['creator'] = this.creator;
    data['event_start'] = this.eventStart;
    data['event_end'] = this.eventEnd;
    data['updated_at'] = this.updatedAt;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    return data;
  }
}
