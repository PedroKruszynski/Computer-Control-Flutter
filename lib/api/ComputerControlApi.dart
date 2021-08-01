import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ComputerControlApi {

  static final String _ip = '192.168.1.9';
  static final String _port = '8888';
  static final Uri _url = Uri.parse('http://$ip:$port');
  static final String _volumeParam = 'volume';

  static String get ip => _ip;
  static String get port => _port;
  static Uri get url => _url;
  static String get volumeParam => _volumeParam;
  static String get volumeUrl => '$url/$volumeParam';

  Future actualVolume() async {
    Uri actualVolumeUrl = Uri.parse('$volumeUrl/showVolume');
    http.Response response = await http.get(actualVolumeUrl);
    return response.body;
  }

  static Future changeVolume(int levelVolume) async {
    Uri changeVolumeUrl = Uri.parse('$volumeUrl/$levelVolume');
    http.Response response = await http.get(changeVolumeUrl);
    return response.body;
  }
  
  // print(jsonDecode(value)['message'])
}