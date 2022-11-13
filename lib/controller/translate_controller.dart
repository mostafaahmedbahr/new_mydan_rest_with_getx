
 import 'package:get/get.dart';

import '../models/lang_model.dart';


class TranslateController extends GetxController{

  var lang = "EN".obs;
  List<LanguageModel> languageList ()
  {
    return [
      LanguageModel(
        name: "ENGLISH",
        code: "EN",
        flag: "assets/images/en.jpg",
        id: 0,
      ),
      LanguageModel(
        name: "ARABIC",
        code: "AR",
        flag: "assets/images/ar.jpg",
        id: 1,
      ),
    ];
  }

  changeLanguage(LanguageModel languageModel)
  {
    print(languageModel.code);
    update();
  }

}