import 'package:offertelavoroflutter_it_app/errors/network_error.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauunchService {
  Future<void> openUrlInApp(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    )) {
      throw NetworkError(400, "'Could not launch $url'");
    }
  }
}
