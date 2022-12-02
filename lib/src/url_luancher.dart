// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:url_launcher/url_launcher.dart';

class URL {
  static launch({required String url}) async {
    try {
      final Uri _url = Uri.parse(url);
      if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $_url';
      }
    } catch (e) {
      //DoSMTH
    }
  }
}
