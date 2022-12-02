import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahla_dz/constants.dart';
import 'package:sahla_dz/src/url_luancher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 31,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "تواصل معنا",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.white),
              ),
              Flexible(
                child: Text(
                  "لمختلف استفساراتكم او طلباتكم يمكنكم مراسلتنا عبر مختلف مواقع التواصل الاجتماعي … وسوف تتلقي الرد في اسرع وقت ممكن من فريق العمل",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.white),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          URL.launch(
                              url:
                                  "https://api.whatsapp.com/send?phone=+213778916758&text=%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85%20%D8%B9%D9%84%D9%8A%D9%83%D9%85%20%D9%81%D8%B1%D9%8A%D9%82%20Sahla%20DZ%20,");
                        },
                        child: SvgPicture.asset(
                          "$iconsPath/whatsapp.svg",
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          URL.launch(url: "https://www.facebook.com/sahla4");
                        },
                        child: SvgPicture.asset(
                          "$iconsPath/facebook.svg",
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          URL.launch(url: "mailto:contact@sahla-dz.com");
                        },
                        child: SvgPicture.asset(
                          "$iconsPath/google.svg",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "$iconsPath/logo-site.png",
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
