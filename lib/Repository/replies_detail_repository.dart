import 'package:http/http.dart' as http;

import '../constants/config.dart';
import '../model/platform_exception.dart';
import '../model/replies_detail.dart';

class RepliesDetailRepository {
  Future<RepliesDetail> fetchData(
      {required String oid, required int type, required int next}) async {
    var response = await http.get(
        Uri.parse(
            'https://api.bilibili.com/x/v2/reply/main?type=$type&next=$next&oid=$oid'),
        headers: headers);
    if (response.statusCode == 200) {
      final result = response.body;
      return RepliesDetail.fromRawJson(result);
    } else {
      throw PlatformException('B站网络请求失败',
          detail:
              'bilibili network request failed status code: ${response.statusCode}');
    }
  }
}
