import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sahla_dz/constants.dart';
import 'package:sahla_dz/src/about_us.dart';
import 'package:sahla_dz/src/contact_us.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SahlaDz extends StatefulWidget {
  const SahlaDz({Key? key}) : super(key: key);

  @override
  State<SahlaDz> createState() => _SahlaDzState();
}

class _SahlaDzState extends State<SahlaDz> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final String mywebsite = 'www.sahla-dz.com';
  int loadingProgress = 0;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        WebViewController webviewController = await _controller.future;
        String? url = await webviewController.currentUrl();
        if (url != "https://$mywebsite" || url != "http://$mywebsite") {
          webviewController.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        key: _key, // Assign the key to Scaffold.
        drawerEnableOpenDragGesture: false,

        floatingActionButton: loadingProgress == 100
            ? FloatingActionButton(
                onPressed: () {
                  _key.currentState?.openEndDrawer();
                },
                backgroundColor: const Color(0xFF509f71),
                child: const Icon(
                  Icons.menu,
                ),
              )
            : null,
        endDrawer: Drawer(
          backgroundColor: const Color(0xFF222222),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 50,
              ),
              ListTile(
                title: const Text(
                  'الرئيسية',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  _controller.future
                      .then((value) => value.loadUrl("https://$mywebsite"));
                  _key.currentState?.closeEndDrawer();
                },
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                title: const Text(
                  'المواضيع السابقة للدكتوراه مع الحلول',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  _controller.future.then(
                      (value) => value.loadUrl("https://lmd.sahla-dz.com/"));
                  _key.currentState?.closeEndDrawer();
                },
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                title: const Text(
                  'البحوث الجامعية الجاهزة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  _controller.future.then(
                      (value) => value.loadUrl("https://ba7thi.sahla-dz.com/"));
                  _key.currentState?.closeEndDrawer();
                },
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                title: const Text(
                  'اربح مع ساهلة ماهلة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  _controller.future.then(
                      (value) => value.loadUrl("https://win.sahla-dz.com/"));
                  _key.currentState?.closeEndDrawer();
                },
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                title: const Text(
                  'من نحن',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AboutUs()));
                },
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                title: const Text(
                  'اتصل بنا',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ContactUs()));
                },
              ),
              const Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                WebView(
                  initialUrl: "https://$mywebsite",
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url.contains("sahla-dz.com")) {
                      _controller.future.then(
                        (value) => request.url.startsWith("https") ||
                                request.url.startsWith("http")
                            ? ""
                            : value.loadUrl("https://${request.url}"),
                      );
                      return NavigationDecision.navigate;
                    } else {
                      _launchUrl(request.url);
                      return NavigationDecision.prevent;
                    }
                  },
                  onProgress: (int progress) {
                    setState(() {
                      loadingProgress = progress;
                    });
                  },
                ),
                Visibility(
                  visible: (loadingProgress != 100),
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("$iconsPath/logo-site.png"),
                        const SizedBox(
                          height: 8,
                        ),
                        CircularProgressIndicator(
                          backgroundColor:
                              const Color.fromARGB(255, 180, 181, 182),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF3F8C9C),
                          ),
                          value: (loadingProgress / 100).toDouble(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl(url) async {
  try {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  } catch (e) {
    // DoSMTH
  }
}
