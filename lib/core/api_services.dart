import 'dart:convert';

import 'package:insights_news/feature/home/data/post_model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<PostModel?> fetchPosts({required String category}) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=125aac10045c4091a1fa77bc672ce782');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        PostModel posts = PostModel.fromJson(json.decode(res.body));
        print(posts.totalResults);
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    print('----------------');
    return null;
  }

  Future<PostModel?> searchNews({required String query}) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&q=$query&apiKey=125aac10045c4091a1fa77bc672ce782');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        PostModel posts = PostModel.fromJson(json.decode(res.body));
        print(posts.totalResults);
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    print('----------------');
    return null;
  }
}
