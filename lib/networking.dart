import 'package:requests/requests.dart';
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    var r = await Requests.get(url, verify: false);

    r.raiseForStatus();

    if (r.statusCode == 200) {
      String data = r.content();

      return jsonDecode(data);
    } else {
      print(r.throwForStatus());
    }
  }
}
