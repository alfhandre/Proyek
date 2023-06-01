import 'dart:convert';

import 'package:calendar_view/calendar_view.dart';

import 'package:get/get.dart';
import '../models/event_model.dart';
import '../models/event.dart';
import 'package:http/http.dart' as http;

class EventController extends GetxController {
  var isLoading = false.obs;

  EventModel? eventModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response =
          await http.get(Uri.tryParse('http://localhost:3000/event')!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        eventModel = EventModel.fromJson(result);
      } else {
        //error
      }
    } catch (e) {
      print('Error while fetching data is $e');
    } finally {
      isLoading(false);
    }
  }
}
