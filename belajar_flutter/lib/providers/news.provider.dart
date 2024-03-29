import 'package:belajar_flutter/helpers/api.dart';
import 'package:belajar_flutter/models/topNews.model.dart';
import 'package:belajar_flutter/utils/const.dart';
import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  bool isLoading = true;
  TopNewsModel? resNews;
  getTopNews() async {
    final res = await api('${baseUrl}top-headlines?country=us&apiKey=$API_KEY');

    if (res.statusCode == 200) {
      resNews = TopNewsModel.fromJson(res.data);
    } else {
      resNews = TopNewsModel();
    }
    isLoading = false;
    notifyListeners();
  }
}
