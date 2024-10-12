import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    print('Could not launch $url');
    throw 'Could not launch $uri';
  }
}
