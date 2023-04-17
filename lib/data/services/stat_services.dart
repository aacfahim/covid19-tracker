import 'dart:convert';

import 'package:covid19_tracker/data/model/world_stat_model.dart';
import 'package:covid19_tracker/utils/api_urls.dart';
import 'package:http/http.dart' as http;

class StatServices {
  Future<WorldStatModel> fetchWorldStatsRecords() async {
    final response = await http.get(Uri.parse(ApiUrls.worldStatApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatModel.fromJson(data);
    } else {
      throw Exception("error");
    }
  }
}
