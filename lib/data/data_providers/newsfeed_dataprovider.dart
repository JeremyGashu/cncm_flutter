import 'package:cncm_flutter_new/core/urls.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class NewsFeedDataProvider {
  Future<http.Response> loadNewsFeed() async {
    Box authData = Hive.box('authData');
    var value = await authData.get('authData');
    http.Response response = await http.get(Uri.parse('$baseUrl/news-feeds'),
        headers: {'Authorization': 'Bearer ${value['token']}'});
    return response;
  }
}
