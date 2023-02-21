import 'package:http/http.dart' as http;

import '../constants/config.dart';
import '../model/platform_exception.dart';
import '../model/web_dynamic_detail.dart';

class WebDynamicDetailRepository {
  Future<WebDynamicDetail> fetchData(String id) async {
    var response = await http.get(
        Uri.parse(
            'https://api.bilibili.com/x/polymer/web-dynamic/v1/detail?id=$id'),
        headers: headers);
    if (response.statusCode == 200) {
      final result = response.body;
      return WebDynamicDetail.fromRawJson(result);
    } else {
      throw PlatformException('B站网络请求失败',
          detail:
              'bilibili network request failed status code: ${response.statusCode}');
    }
  }
}
