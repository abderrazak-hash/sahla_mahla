import 'package:flutter/material.dart';
import 'package:sahla_dz/constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
            horizontal: 30,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "حول التطبيق",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                child: Text(
                  "نعمل في منصة ساهلة ماهلة على تزويد الطالب الجامعي والباحث بكل ما يحتاجه من أجل انهاء بحثه ومذكرة تخرجه بأفضل صورة ممكن ... من خلال مجموعة متكاملة من خيرة الطلبة والذين لطالما عانوا من صعوبة الوصول إلى المعلومة وخاصة ايام الحجر الصحي ... فتم تأسيس المصنة لتكون خير معين لكم في مشواركم الدراسي وحتي المهني",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: Text(
                  "بخلاف اننا اول منصة من نوعها في الجزائر تقدم كل ما يحتاجه الطالب ولجميع التخصصات، تتوفر ساهلة ماهلة على مجموعة خدماتية فريدة من نوعها بالجودة اللازمة والسرعة المطلوبة حيث جميع خدماتنا يشرف عليها طاقم مختص مكون من طلبة واساتذة كل في مجاله",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.white),
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
