import 'package:http/http.dart' as http;

class ComputerControlApi {

  static final String _ip = '192.168.1.9';
  static final String _port = '8888';
  static final Uri _url = Uri.parse('http://$ip:$port');
  static final String _volumeParam = 'volume';
  static final String _mouseParam = 'mouse';

  static String get ip => _ip;
  static String get port => _port;
  static Uri get url => _url;
  static String get volumeParam => _volumeParam;
  static String get volumeUrl => '$url/$volumeParam';
  static String get mouseParam => _mouseParam;
  static String get mouseUrl => '$url/$mouseParam';

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
  
  static Future mouseRightClick() async {
    Uri mouseRightClickUrl = Uri.parse('$mouseUrl/right');

    http.Response response = await http.get(mouseRightClickUrl);
    return response.body;
  }

  static Future mouseLeftClick(bool doubleTap) async {
    Uri mouseLeftClickUrl = Uri.parse('$mouseUrl/left?doubleClick=$doubleTap');

    http.Response response = await http.get(mouseLeftClickUrl);
    return response.body;
  }

  static Future mousePosition(double x, double z) async {

    if (x == 0.0 && z == 0.0) {
      return "Nothing Change";
    }

    String x1 = x.abs().toString().replaceAll(".", "").substring(0, 4);
    String z1 = z.abs().toString().replaceAll(".", "").substring(0, 3);

    Uri mousePositionUrl = Uri.parse('$mouseUrl/$x1/$z1');
    http.Response response = await http.get(mousePositionUrl);
    return response.body;
  }

}