import 'dart:convert';

import 'package:cncm_flutter_new/data/data_providers/newsfeed_dataprovider.dart';
import 'package:cncm_flutter_new/data/models/news_feed.dart';
import 'package:http/http.dart' as http;

class NewsFeedRepository {
  final NewsFeedDataProvider newsFeedDataProvider;

  NewsFeedRepository(this.newsFeedDataProvider);
  Future<List<NewsFeed>> loadNewsFeed() async {
    http.Response response = await newsFeedDataProvider.loadNewsFeed();
    if (response.statusCode == 200) {
      List results = jsonDecode(response.body)['results']['rows'] as List;
      return results.map((e) => NewsFeed.fromJson(e)).toList();
    }
    return [];
  }
}
