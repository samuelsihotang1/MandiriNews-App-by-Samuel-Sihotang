import 'package:NewsApp/helpers/api.dart';
import 'package:NewsApp/models/topNews.model.dart';
import 'package:NewsApp/utils/const.dart';
import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  bool isLoading = true;
  TopNewsModel? resNews;
  TopNewsModel? resEverythingNews;

  Future<void> getTopNews() async {
    try {
      final res = await api(
          '${baseUrl}top-headlines?country=us&pageSize=1&apiKey=$API_KEY');

      if (res.statusCode == 200) {
        resNews = TopNewsModel.fromJson(res.data);
      } else {
        throw Exception('Failed to load news: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getEverthingNews() async {
    try {
      final resEverything = await api(
          '${baseUrl}everything?language=en&q=a&sortBy=publishedAt&apiKey=$API_KEY');

      if (resEverything.statusCode == 200) {
        resEverythingNews = TopNewsModel.fromJson(resEverything.data);
      } else {
        throw Exception('Failed to load news: ${resEverything.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
    isLoading = false;
    notifyListeners();
  }
}
