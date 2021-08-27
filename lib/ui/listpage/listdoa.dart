import 'package:al_quran/data/models/alldoa.dart';
import 'package:al_quran/data/services.dart';
import 'package:al_quran/data/uistate.dart';
import 'package:al_quran/ui/widget/carddoa.dart';
import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:provider/provider.dart';
//    "latin": "বাংলা উচ্চারণ: আল্লা-হু লা ইলা-হা ইল্লা হুওয়াল হাইয়্যুল ক্বাইয়্যুম। লা তা’খুযুহু সিনাতুঁ ওয়ালা নাঊম। লাহূ মা ফিস্ সামা-ওয়াতি ওয়ামা ফিল আরদ্বি। মান যাল্লাযী ইয়াশফাউ’ ই’ন্দাহূ ইল্লা বিইজনিহি। ইয়া’লামু মা বাইনা আইদিহিম ওয়ামা খালফাহুম, ওয়ালা ইউহিতূনা বিশাইয়্যিম্ মিন ‘ইলমিহি ইল্লা বিমা শা-আ’ ওয়াসিআ’ কুরসিইয়্যুহুস্ সামা-ওয়া-তি ওয়াল আরদ্বি, ওয়ালা ইয়াউ’দুহূ হিফযুহুমা ওয়া হুওয়াল ‘আলিইয়্যুল আ’জিম। (সূরা আল-বাক্বারা আয়াত-২৫৫)। অর্থ: আল্লাহ, যিনি ব্যতীত কোনো উপাস্য নেই। যিনি চিরঞ্জীব ও বিশ্বচরাচরের ধারক। কোনো তন্দ্রা বা নিদ্রা তাঁকে পাকড়াও করতে পারে না। আসমান ও জমিনে যা কিছু আছে সবকিছু তারই মালিকানাধীন। তাঁর হুকুম ব্যতিত এমন কে আছে যে, তাঁর নিকটে সুফারিশ করতে পারে? তাদের সম্মুখে ও পিছনে যা কিছু আছে সবকিছুই তিনি জানেন। তাঁর জ্ঞানসমুদ্র হতে তারা কিছুই আয়ত্ত করতে পারে না, কেবল যতুটুকু তিনি দিতে ইচ্ছা করেন তা ব্যতিত। তাঁর কুরসি সমগ্র আসমান ও জমিন পরিবেষ্টন করে আছে। আর সেগুলোর তত্ত্বাবধান তাঁকে মোটেই শ্রান্ত করে না। তিনি সর্বোচ্চ ও মহান’।মহান রাব্বুল আলামিন আমাদের সবাইকে আয়াতুল কুরসির পড়ার তাওফিক দান করুন। আমিন।"

class ListDoa extends StatefulWidget {
  @override
  _ListDoaState createState() => _ListDoaState();
}

class _ListDoaState extends State<ListDoa> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiState>(context);
    return Scaffold(
      body: FutureBuilder<List<AllDoa>>(
        future: ServiceData().loadDoa(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? ListView(

                  children: snapshot.data
                      .map((du) => CardDoa(
                            title: du.title,
                            arabic: du.arabic,
                            latin: du.latin,
                            fontarabic: ui.fontSize,
                            terjemahan: ui.terjemahan,
                            translate: du.translation,
                          ))
                      .toList(),
                )
              : PKCardPageSkeleton(
                  totalLines: 5,
                );
        },
      ),
    );
  }
}
