import 'package:http/http.dart';

class HttpHelper {
  final Client httpClient;

  HttpHelper(this.httpClient);

  Future<Response> getData(String url) async {
    final Uri uri = Uri.parse(url);
    final Response response = await httpClient.get(uri);
    return response;
  }
}
