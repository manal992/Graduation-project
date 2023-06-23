import 'package:flutter/material.dart';
import 'package:nicu/component/button.dart';
import 'package:nicu/screen/doctor_screen/doctor_booking.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List doctor = [
    {
      "name": "دكتور محمد مصطفى الطويل ",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTd12306/Profile/150/doctor-mohamed-mostafa-el-tawil-pediatrics.jpg",
      "address": """
مدينة نصر : ٩٦ شارع مصطفى النحاس""",
      "badget": "400 جنيه"
    },
    {
      "name": "دكتور محمد عبد الرازق ",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTd5212a7881a250b5/Profile/150/doctor-mohamed-abdel-razek-pediatrics-and-new-born_20210708014139007.jpg",
      "address": """
مدينة نصر : شارع حسن المامون""",
      "badget": "300 جنية"
    },
    {
      "name": "دكتور طارق زكريا العادلي",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT481479/Profile/150/doctor-tarek-zakaria-el-adly-pediatrics-and-new-born_20210906223349815.jpg",
      "address": """مصر الجديدة : شارع الثورة،""",
      "badget": "400 جنيه"
    },
    {
      "name": "دكتور محمد الغواص",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT1a03fc/Profile/150/doctor-mohamed-ezzat-elghawas-pediatrics_20170315061850.jpg",
      "address": """
التجمع : بجوار محطه موبيل""",
      "badget": "500 جنيه"
    },
    {
      "name": " دكتور هالة حسين",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTf7de9930ddeb1631/Profile/150/hala-hussien-pediatrics-and-new-born_20220110204716072.jpg",
      "address": """مستشفى دار الصحة (التجمع)""",
      "badget": ""
    },
    {
      "name": "دكتور ريم نبيل",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTfd56289e428805d7/Profile/150/reem--nabil-pediatrics-and-new-born_20220124165702552.jpg",
      "address": """مستشفى السلام الدولي (المعادي)""",
      "badget": "500 جنيه"
    },
    {
      "name": "دكتور اسامة زكى",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTea4ce978616c3aeb/Profile/150/osama-zaki-pediatrics-and-new-born_20211101130536131.jpg",
      "address": """عيادات سبيد (مصر الجديدة)""",
      "badget": "450 جنيه"
    },
    {
      "name": "دكتورة الروحاء احمد ابوعامر",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT999888/Profile/150/al-rowhaa-ahmed-abo-amer-pediatrics-and-new-born_20190714164842598.jpg",
      "address": """عيادات سبيد (مصر الجديدة)""",
      "badget": "450 جنيه"
    },
    {
      "name": "دكتورة سنيه فهمى",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTbc9a18/Profile/150/doctor-saneya-fahmy-pediatrics-and-new-born_20190128134354667.jpg",
      "address": """التجمع : شارع الطبيب""",
      "badget": "350 جنيه"
    },
    {
      "name": " دكتور بهاء الدين حسنين ",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTc1ab7c53f287cd06/Profile/150/bahaa-el-din--hassanein-pediatrics-and-new-born_20220124164819794.jpg",
      "address": """مستشفى السلام الدولي (المعادي)""",
      "badget": "  500جنيه"
    },
    {
      "name": "دكتورة ايمان عبد الرحيم",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTaef631/Profile/150/doctor-iman-abd-elrehim-pediatrics-and-new-born_20210408184518734.jpg",
      "address": """
مدينة نصر : على امين""",
      "badget": "250 جنيه"
    },
    {
      "name": "دكتور محمد شومان",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTd228927e69c6c1ac/Profile/150/doctor-mohamed-abd-elkader-pediatric-surgery_20220414163445683.jpg",
      "address": """عيادات عيادات مجمع الاطباء التخصصيه (المعادي)""",
      "badget": "300 جنيه"
    },
    {
      "name": "دكتورة رشا عادل ثابت",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTd33cb16c49cad14d/Profile/150/rasha-adel-thabet-dietitian-and-nutrition_20230129221150720.jpg",
      "address": """عيادات سبيد (مصر الجديدة)
نهرو,مصر الجديدة""",
      "badget": "450 جنيه"
    },
    {
      "name": "دكتورة وسام احمد محرم",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT6cf9fe/Profile/150/doctor-wessam-ahmed-mouharam-pediatrics-and-new-born.jpg",
      "address": """التجمع : محور السادات""",
      "badget": "350 جنيه"
    },
    {
      "name": "دكتورة سنيه فهمى",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTbc9a18/Profile/150/doctor-saneya-fahmy-pediatrics-and-new-born_20190128134354667.jpg",
      "address": """التجمع : شارع الطبيب""",
      "badget": "350 جنيه"
    },
    {
      "name": "عيادة أشرف سيد كامل",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT533c14/Profile/150/clinic-ashraf-sayed--kamel-pediatrics-and-new-born_20190326144916025.jpg",
      "address": """حلوان : شارع أحمد أنسي تقاطع شريف""",
      "badget": "150 جنيه"
    },
    {
      "name": "دكتورة نيرة هزاع الشريف",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTd76cd1b5bf759802/Profile/150/doctor-nayera-elsherif-pediatrics-and-new-born_20210804173830298.jpg",
      "address": """
مدينة نصر : شارع النور المفتي""",
      "badget": "400 جنيه"
    },
    {
      "name": "دكتورة رشا حسن",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTb10fd2079c7fd08c/Profile/150/rasha-hassan-pediatrics-and-new-born_20210727165842834.jpg",
      "address": """عيادات عيادات حماية بلس (مدينة نصر)""",
      "badget": "400 جنيه"
    },
    {
      "name": "دكتور عبدالله مكى ",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT4c195c/Profile/150/doctor-abdullah-ahmed-meky-neurology_20171122032014231.jpg",
      "address": """شبرا الخيمة : ش ١٥مايو تقاطع الشارع الجديد""",
      "badget": "350 جنيه"
    },
    {
      "name": "دكتور هيثم الحجر ",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT7fc1b9/Profile/150/doctor-haitham-el-hagar-urology-1_20230102143645098.jpg",
      "address": """المرج : مؤسسة الزكاة محطة الورشة""",
      "badget": "150 جنيه"
    },
    {
      "name": "دكتور عبدالسلام الشامي",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT4c2ab1/Profile/150/doctor-abdel-salam-el-shamy-chest-and-respiratory_20211112203351031.jpg",
      "address": """
مدينة العبور : الحي الاول محور السادات امام المركز الاسلامي""",
      "badget": "300 جنيه"
    },
    {
      "name": " دكتور محمد محمد اسماعيل",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTf99340/Profile/150/doctor-mohamed-mohamed-ismail-pediatrics-and-new-born_20170905153239.jpg",
      "address": """وسط البلد : شارع القصر العيني""",
      "badget": "350 جنيه"
    },
    {
      "name": "دكتور اسامه محمد قاسم",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTde8aec092d0bcef7/Profile/150/doctor-mostafa-farouk-pediatrics-and-new-born-2_20220302203507776.jpg",
      "address": """مصر الجديدة : شارع المقريزي""",
      "badget": "300 جنيه"
    },
    {
      "name": "دكتور حمدي عواد عباس",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT8dd2dbad5469cdfc/Profile/150/doctor-hamdy-awad-pediatrics-and-new-born_20220817000335363.jpg",
      "address": """مدينة نصر : شارع ٣""",
      "badget": "300 جنيه"
    },
    {
      "name": "دكتور احمد ممدوح صالح",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTa08eb6/Profile/150/doctor-ahmed-mamdouh-saleh-pediatrics-and-new-born_20190615215959892.jpg",
      "address": """مدينتي : بجوار مركز المدينة""",
      "badget": "300 جنيه"
    },
    {
      "name": "دكتورة عزة عبد الغني",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTa767dc/Profile/150/nermeen-adel-pediatrics-and-new-born_20200202110652809.jpg",
      "address": """ 
التجمع : كايرو ميديكال سنتر""",
      "badget": "500 جنيه"
    },
    {
      "name": "دكتورة ساره حسني",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTcf5553/Profile/150/doctor-sara-hosny-pediatrics-and-new-born_20170727124124.jpg",
      "address": """
حلوان : -المحطة""",
      "badget": "150 جنيه"
    },
    {
      "name": "دكتور رامز بادير رمزي",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTe91e14/Profile/150/doctor-ramez-badir-pediatrics-and-new-born.jpg",
      "address": """
وسط البلد : شارع رمسيس غمره""",
      "badget": "400 جنيه"
    },
    {
      "name": "دكتورة بثينة عبد الحسيب",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT409eeb/Profile/150/doctor-bothaina-abd-el-haseeb-pediatrics-and-new-born_20211007001447088.jpg",
      "address": """
مدينة نصر : طريق النصر""",
      "badget": "300 جنيه"
    },
    {
      "name": "دكتورة دينا عمر",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTf56a7b87fd46357f/Profile/150/dina-omar-pediatrics-and-new-born_20221127142812962.jpg",
      "address": """عيادات بلاتينوم (التجمع)""",
      "badget": "350 جنيه"
    },
    {
      "name": "دكتور احمد عبدالحميد",
      "image":
          "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT258124c240006f1b/Profile/150/doctor-ahmed--abdulhamid--pediatrics-and-new-born_20211121153835210.jpg",
      "address": """مدينة نصر : شارع زاكر حسين""",
      "badget": "300 جنيه"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).splashColor,
        centerTitle: true,
        title: Text(
          'Doctors',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Theme.of(context).secondaryHeaderColor),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(doctor[index]['image']),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            doctor[index]['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(doctor[index]['address'])
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('02:00 pm To 10:00 pm')
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.price_check,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(doctor[index]['badget']),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 36,
                            child: DefaultButton(
                              text: 'Book',
                              function: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Booking(
                                              title: doctor[index]['name'],
                                            )));
                              },
                              backGroundButton:
                                  Theme.of(context).secondaryHeaderColor,
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: doctor.length),
      ),
    );
  }
}
