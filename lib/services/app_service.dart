import 'dart:convert';

import 'package:http/http.dart' as http;
import '/model/app_model.dart';

class NetworkCallService {
  Future<List<AppModel>?> getCompleted() async {
    final url = Uri.parse("http://cureme.co.in/api/GetMyAppointment/previous");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<AppModel> completedModel = data.map((dynamic item) => AppModel.fromJson(item)).toList();
      return completedModel;
    }
    return null;
  }

  Future<List<AppModel>?> getUpcoming() async {
    final url = Uri.parse("http://cureme.co.in/api/GetMyAppointment/upcoming");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<AppModel> upcomingModel = data.map((dynamic item) => AppModel.fromJson(item)).toList();
      return upcomingModel;
    }
    return null;
  }
}
