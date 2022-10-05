import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String urld;
  NetworkHelper(this.urld);

  Future getdata() async {
    var url = Uri.parse(urld);
    var response = await http.get(url);
    var deode = jsonDecode(response.body);

    return deode;
  }
}
